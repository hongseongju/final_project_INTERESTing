import requests
from django.conf import settings
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.http import JsonResponse
from .models import FinancialProduct, OptionList
from .serializers import SavingsProductsSerializer, SavingsOptionsSerializer
from .models import DepositProduct, DepositOption
from .serializers import DepositProductSerializer, DepositOptionSerializer
# Create your views here.
BASE_URL = 'http://finlife.fss.or.kr/finlifeapi/'

# !! env로 이동 필요
ACCOUNT_API_KEY = settings.ACCOUNT_API_KEY

@api_view(['GET'])
def saving_rate(request):
    URL = BASE_URL + 'savingProductsSearch.json'
    params = {
        'auth': ACCOUNT_API_KEY,
        'topFinGrpNo': '020000',    #은행코드: 020000
        'pageNo': '1'
    }
    response = requests.get(URL, params=params).json()
    products = response.get('result').get('baseList')
    
    for li in products:
        fin_co_no = li['fin_co_no']
        fin_prdt_cd = li['fin_prdt_cd']
        kor_co_nm = li['kor_co_nm']
        fin_prdt_nm = li['fin_prdt_nm']
        join_way = li['join_way']
        mtrt_int = li['mtrt_int']
        spcl_cnd = li['spcl_cnd']
        join_member =li['join_member']
        etc_note = li['etc_note']

        save_data = {
            'fin_co_no': fin_co_no,
            'fin_prdt_cd': fin_prdt_cd,
            'kor_co_nm': kor_co_nm,
            'fin_prdt_nm': fin_prdt_nm,
            'join_way': join_way,
            'mtrt_int': mtrt_int,
            'spcl_cnd': spcl_cnd,
            'join_member': join_member,
            'etc_note': etc_note
        }
        # 겹치는 필드
        if FinancialProduct.objects.filter(fin_prdt_cd=li['fin_prdt_cd']).exists():
            continue
        product_serializer = SavingsProductsSerializer(data=save_data)
        # 유효성 검증
        if product_serializer.is_valid(raise_exception=True):
            # 유효하다면 저장
            product = product_serializer.save()
            
    # 옵션 데이터 처리 
    options = response.get('result').get('optionList')
    for li in options:
        product = FinancialProduct.objects.get(fin_prdt_cd=li['fin_prdt_cd'])
        if OptionList.objects.filter(financial_product=product,
                                        fin_prdt_cd = li['fin_prdt_cd'],
                                        intr_rate_type = li['intr_rate_type'],
                                        intr_rate_type_nm = li['intr_rate_type_nm'],
                                        rsrv_type = li['rsrv_type'],
                                        rsrv_type_nm = li['rsrv_type_nm'],
                                        save_trm = li['save_trm'],
                                        intr_rate = li['intr_rate'],
                                        intr_rate2 = li['intr_rate2'],
                                        ).exists():
            continue
        option_serializer = SavingsOptionsSerializer(data=li)
        # 유효성 검증
        if option_serializer.is_valid(raise_exception=True):
            # 유효하다면 저장
            option_serializer.save(financial_product=product)
    
    rate = FinancialProduct.objects.all()

    serializer = SavingsProductsSerializer(rate, many=True)

    return Response(serializer.data)

# 적금 추가
@api_view(['GET'])
def deposit_rate(request):
    URL = BASE_URL + 'depositProductsSearch.json'
    params = {
        'auth': ACCOUNT_API_KEY,
        'topFinGrpNo': '020000',    # 은행코드: 020000
        'pageNo': '1'
    }
    response = requests.get(URL, params=params).json()
    products = response.get('result').get('baseList')
    
    for li in products:
        fin_prdt_cd = li['fin_prdt_cd']
        dcls_month = li['dcls_month']
        fin_co_no = li['fin_co_no']
        kor_co_nm = li['kor_co_nm']
        fin_prdt_nm = li['fin_prdt_nm']
        join_way = li['join_way']
        mtrt_int = li['mtrt_int']
        spcl_cnd = li['spcl_cnd']
        join_deny = li['join_deny']
        join_member = li['join_member']
        etc_note = li['etc_note']
        max_limit = li['max_limit']
        dcls_strt_day = li['dcls_strt_day']
        dcls_end_day = li.get('dcls_end_day')  # 'dcls_end_day' 필드가 없을 수도 있으므로 .get() 메서드 사용

        save_data = {
            'fin_prdt_cd': fin_prdt_cd,
            'dcls_month': dcls_month,
            'fin_co_no': fin_co_no,
            'kor_co_nm': kor_co_nm,
            'fin_prdt_nm': fin_prdt_nm,
            'join_way': join_way,
            'mtrt_int': mtrt_int,
            'spcl_cnd': spcl_cnd,
            'join_deny': join_deny,
            'join_member': join_member,
            'etc_note': etc_note,
            'max_limit': max_limit,
            'dcls_strt_day': dcls_strt_day,
            'dcls_end_day': dcls_end_day
        }
        if DepositProduct.objects.filter(fin_prdt_cd=fin_prdt_cd).exists():
            continue
        product_serializer = DepositProductSerializer(data=save_data)
        if product_serializer.is_valid(raise_exception=True):
            product_serializer.save()
    
    options = response.get('result').get('optionList')
    for li in options:
        product = DepositProduct.objects.get(fin_prdt_cd=li['fin_prdt_cd'])
        if DepositOption.objects.filter(deposit_product=product, **li).exists():
            continue
        option_serializer = DepositOptionSerializer(data=li)
        if option_serializer.is_valid(raise_exception=True):
            option_serializer.save(deposit_product=product)
    
    rate = DepositProduct.objects.all()
    serializer = DepositProductSerializer(rate, many=True)

    return Response(serializer.data)



def financial_products(request):
    products = FinancialProduct.objects.all()
    response_data = []
    for product in products:
        options = product.options.all()
        product_data = {
            'fin_prdt_cd': product.fin_prdt_cd,
            'fin_prdt_nm': product.fin_prdt_nm,
            'kor_co_nm': product.kor_co_nm,
            'join_way': product.join_way,
            'spcl_cnd': product.spcl_cnd,
            'etc_note': product.etc_note,
            'options': list(options.values(
                'id', 'intr_rate_type_nm', 'save_trm', 'intr_rate', 'intr_rate2'
            ))
        }
        response_data.append(product_data)
    return JsonResponse(response_data, safe=False)
