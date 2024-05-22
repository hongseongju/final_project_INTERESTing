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
deposit_info = []
all_info = []
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
    # 'savings_depositproduct',
    # 'savings_financialproduct',
    # 'savings_depositoption',
    # 'savings_optionlist',
    ]

for db in db_list:
    # 상품 정보 등록
    if 'product' in db:
        cursor.execute(f"SELECT fin_prdt_cd, fin_co_no, kor_co_nm, fin_prdt_nm FROM {db}")
    # 옵션 정보 등록
    else :
        cursor.execute(f'SELECT fin_prdt_cd, rsrv_type_nm, save_trm, intr_rate, intr_rate2  FROM {db}')
        
    rows = cursor.fetchall()
    columns = [description[0] for description in cursor.description]
    df = pd.DataFrame(rows, columns=columns)
    json_data = df.to_json(orient='records', force_ascii=False)
    if 'product' in db:
        product_info.extend(json.loads(json_data))
    elif 'deposit' in db:
        deposit_info.extend(json.loads(json_data))
    else:
        all_info.extend(json.loads(json_data))

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
            {"role": "system", "content": f"반드시 한글로 대답해줘."}
        ] 
    )
    
    if '은행' in input_message and '추천' in input_message:
        print(product_info[0]['kor_co_nm'])
        chat_history.append(
            {"role": "system", "content": f"만약 은행을 추천한다면 {product_info} 정보에 기반해서 한글로 2개 정도 추천해줘. 그리고 {all_info}에서 fin_prdt_cd가 동일한 정보의 최저금리: intr_rate 와 최고금리: intr_rate2를 알려줘."}
        )
    if '예금' in input_message and '추천' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 예금 상품을 추천한다면 아래 정보에 기반해서 예금 상품의 이름과 함께 정보를 한글로 답변해줘. {deposit_info} 예금 상품의 이름은 각 딕셔너리 내의 'fin_prdt_nm'의 값이야." }
        )
    if '적금' in input_message and '추천' in input_message:
        chat_history.append(
            {"role": "system", "content": f"만약 적금 상품을 추천한다면 아래 정보에 기반해서 적금 상품의 이름과 함께 정보를 한글로 답변해줘. {all_info} 적금 상품의 이름은 각 딕셔너리 내의 'fin_prdt_nm'의 값이야."}
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
        print(output_message)
        chat_history.append({"role": "assistant", "content": f"{output_message}"})
        return Response(output_message,status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({'error': str(e)},status=status.HTTP_500_INTERNAL_SERVER_ERROR)