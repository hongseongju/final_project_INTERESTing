import requests
import json
import pandas as pd
from django.conf import settings
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
import pymysql
from openai import OpenAI

# Create your views here.
# DB 데이터를 읽어와서 ai한테 줄 리스트로 만들기
product_info = []
savings_info = []
deposit_info = []
# with open('파일경로', 'r', encoding='utf-8') as f :
#     text = f.read()

conn = pymysql.connect(
    host='localhost',
    user='INTERESTing',
    password = settings.MYSQL_PASSWORD,
    db = 'interesting'
)
cursor = conn.cursor()
db_list = [
    'savings_financialproduct',
    'deposit_depositproduct',
    'savings_optionlist',
    'deposit_optionlist',
    ]

for db in db_list:
    # 상품 정보 등록
    if 'product' in db:
        cursor.execute(f"SELECT fin_prdt_cd, kor_co_nm, fin_prdt_nm, spcl_cnd FROM {db}")
    # 옵션 정보 등록
    if db == 'savings_optionlist':
        cursor.execute(f'SELECT fin_prdt_cd, rsrv_type_nm, save_trm, intr_rate, intr_rate2  FROM {db}')
    elif db == 'deposit_optionlist':
        cursor.execute(f'SELECT deposit_product_id, rsrv_type_nm, save_trm, intr_rate, intr_rate2  FROM {db}')
    
    rows = cursor.fetchall()
    columns = [description[0] for description in cursor.description]
    df = pd.DataFrame(rows, columns=columns)
    json_data = df.to_json(orient='records', force_ascii=False)
    if 'product' in db:
        product_info.extend(json.loads(json_data))
    elif 'savings' in db:
        deposit_info.extend(json.loads(json_data))
    elif 'deposit' in db:
        savings_info.extend(json.loads(json_data))

conn.close()

# Chat history를 저장하기 위한 전역 변수
chat_history = []

@api_view(['GET'])
def chat_bot(request):
    global chat_history
    print('//////')
    API_KEY = settings.OPENAI_API_KEY
    # print(API_KEY)
    client = OpenAI(api_key=API_KEY)
    
    input_message = request.query_params.get('message','')
    print(input_message)
    #아래 정보에 기반해서 답변해줘야해 {bank_info}
    chat_history.extend(
        [
            {"role": "user", "content": f"{input_message}"},
            {"role": "system", "content": f"반드시 한글로 대답해줘. 너는 금리비교 사이트인 INTERESTing의 챗봇으로 사람들에게 추천 예적금을 알려줘야 해."}
        ] 
    )
    
    if '은행' in input_message and '추천' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 은행을 추천한다면 {product_info}에 기반해서 kor_co_nm와 fin_prdt_nm를 3개 추천해줘."}
        )
    elif '은행' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 은행에 대해 물어보면 {product_info}의 kor_co_nm만 5개 정도 알려줘."}
        )
        
    if '예금' in input_message and  '적금' in input_message and '추천' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 예금, 적금 상품을 추천한다면 {input_message}와 {product_info}의 spcl_cnd 정보에 기반해서 예금, 적금 상품을 합쳐서 3개 정도 추천해줘."}
        )
    elif '예금' in input_message and '추천' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 예금 상품을 추천한다면 {input_message}와 {product_info}의 spcl_cnd 정보에 기반해서 예금 상품을 3개 정도 추천해줘. 적금은 추천해주면 안돼"}
        )
    elif '적금' in input_message and '추천' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 적금 상품을 추천한다면 {input_message}와 {product_info}의 spcl_cnd 정보에 기반해서 적금 상품을 3개 정도 추천해줘. 예금은 추천해주면 안돼" }
        )
        
    if '금리' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 금리를 물어봤는데 금융상품인 fin_prdt_nm를 선택 안했다면 어떤 상품으로 조회할지 먼저 물어봐 줘. fin_prdt_nm를 선택했다면 {deposit_info}에 기반해서 물어본 savings_info의 최저금리 intr_rate와 최고금리 intr_rate2를 알려줘."}
        )
    print('중간지점')
    try:
        response = client.chat.completions.create(
            model="gpt-4o",
            temperature=0.0,
            # response_format={'type':'json_object'},
            messages= chat_history,
            stop=['Human'],
            frequency_penalty=0.5,
            presence_penalty=0.5
        )
        output_message = response.choices[0].message.content
        # print(output_message)
        chat_history.append({"role": "assistant", "content": f"{output_message}"})
        return Response(output_message,status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({'error': str(e)},status=status.HTTP_500_INTERNAL_SERVER_ERROR)