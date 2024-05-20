from django.conf import settings
import requests
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Exchange
from .serializers import ExchangeSerializer

BASE_URL = 'https://www.koreaexim.go.kr/site/program/financial/exchangeJSON'

EXCHANGE_API_KEY = settings.EXCHANGE_API_KEY

# Create your views here.
@api_view(['GET'])
def exchage_rate(request):
    params = {
        'authkey': EXCHANGE_API_KEY,
        # 'searchdate': '20240516', # 이거 빼면 오늘 날짜로 들어감 단점! 주말에는 데이터 없음 이거 없애면 실시간으로 뜸
        'data': 'AP01', 

    }
    response = requests.get(BASE_URL, params=params).json()
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
    serializer = ExchangeSerializer(rate, many=True)
    return Response(serializer.data)
