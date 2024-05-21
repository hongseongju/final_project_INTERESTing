import requests
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.http import JsonResponse
from .models import PopularStock
from .serializers import PopularStockSerializer

BASE_URL = 'https://polling.finance.naver.com/api/realtime/domestic/stock/028300%2C001440%2C005930%2C294090%2C450080%2C003230%2C443060%2C024840%2C229640%2C000660%2C247540%2C086520%2C012800%2C007660%2C005490%2C348370%2C027830%2C352820%2C199820%2C003350'

# Create your views here.
@api_view(['GET'])
def popular(request):
    response = requests.get(BASE_URL).json()
    stocks = response.get('datas', [])

    for li in stocks:
        itemCode = li['itemCode']
        stockName = li['stockName']
        closePrice = li['closePrice']
        compareToPreviousClosePrice = li['compareToPreviousClosePrice']
        code = li['compareToPreviousPrice']['code']
        text = li['compareToPreviousPrice']['text']
        
        save_data = {
            'itemCode': itemCode,
            'stockName': stockName,
            'closePrice': closePrice,
            'compareToPreviousClosePrice': compareToPreviousClosePrice,
            'code': code,
            'text': text,
        }
        # 겹치는 필드 중복 저장 안되게 처리(종목코드를 기준으로)
        if PopularStock.objects.filter(itemCode=itemCode).exists():
            continue
        stock_serializer = PopularStockSerializer(data=save_data)
        # 유효성 검증
        if stock_serializer.is_valid(raise_exception=True):
            # 유효하다면 저장
            stock = stock_serializer.save()

    rate = PopularStock.objects.all()
    serializer = PopularStockSerializer(rate, many=True)
    
    return Response(serializer.data)
