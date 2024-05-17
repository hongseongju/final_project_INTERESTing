import requests
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Exchange
# from rest_framework import viewsets  #  CRUD 작업 처리 위한 패키지
from .serializers import ExchangeSerializer
# Create your views here.

BASE_URL = 'https://www.koreaexim.go.kr/site/program/financial/exchangeJSON'
# !! env로 이동 필요
EXCHAGE_API_KEY = 'q967vmJ6okD45DDROHTSKu97gSQNSA6A'

# Create your views here.
@api_view(['GET'])
def exchage_rate(request):
    print(request)
    params = {
        'authkey': EXCHAGE_API_KEY,
        'data': 'AP01',

    }
    response = requests.get(BASE_URL, params=params).json()
    print(response)
    for li in response:
        cur_nm = li.get('cur_nm')                                   # 국가/통화명
        cur_unit = li.get('cur_unit')                               # 통화코드
        value_deal_bas_r = li.get('deal_bas_r').replace(',', '')    # 매매기준율
        value_ttb = li.get('ttb').replace(',','')                   # 송금 받을때

        save_data = {
            'cur_nm': cur_nm,
            'cur_unit': cur_unit,
            'deal_bas_r': float(value_deal_bas_r),
            'ttb': float(value_ttb),
        }
        Exchange.objects.update_or_create(
                                cur_unit=li['cur_unit'],
                                defaults=save_data
                            )
    rate = Exchange.objects.all()
    print(rate)
    serializer = ExchangeSerializer(data=rate, many=True)
    print(serializer.data)
    # 
    # safe=False: 보통 JsonREsponse는 안전한 응답만 처리되어서 필요
    return Response(serializer.data)

#{ 'message': "exchage save okay!"}