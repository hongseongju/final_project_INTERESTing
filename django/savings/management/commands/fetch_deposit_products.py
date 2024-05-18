import requests
from django.core.management.base import BaseCommand
from savings.models import DepositProduct, DepositOption

class Command(BaseCommand):
    help = 'Fetch deposit products from API and save to database'

    def handle(self, *args, **options):
        API_KEY = 'cafcfc26852ccb85dc3ddd0807a92f24'  # 실제 API 키로 변경하세요
        url = f'http://finlife.fss.or.kr/finlifeapi/depositProductsSearch.json?auth={API_KEY}&topFinGrpNo=020000&pageNo=1'

        response = requests.get(url)
        response.raise_for_status()  # HTTP 에러 발생 시 예외 발생
        deposit_products_data = response.json()['result']

        base_list = deposit_products_data.get('baseList', [])
        option_list = deposit_products_data.get('optionList', [])

        for product in base_list:
            deposit_product, created = DepositProduct.objects.get_or_create(
                fin_prdt_cd=product['fin_prdt_cd'],
                defaults={
                    'dcls_month': product['dcls_month'],
                    'fin_co_no': product['fin_co_no'],
                    'kor_co_nm': product['kor_co_nm'],
                    'fin_prdt_nm': product['fin_prdt_nm'],
                    'join_way': product['join_way'],
                    'mtrt_int': product['mtrt_int'],
                    'spcl_cnd': product['spcl_cnd'],
                    'join_deny': product['join_deny'],
                    'join_member': product['join_member'],
                    'etc_note': product['etc_note'],
                    'max_limit': product['max_limit'] if product['max_limit'] is not None else None,
                    'dcls_strt_day': product['dcls_strt_day'],
                    'dcls_end_day': product['dcls_end_day'] if product['dcls_end_day'] is not None else None,
                    'fin_co_subm_day': product['fin_co_subm_day'],
                }
            )

            for option in option_list:
                if option['fin_prdt_cd'] == deposit_product.fin_prdt_cd:
                    DepositOption.objects.get_or_create(
                        deposit_product=deposit_product,
                        dcls_month=option.get('dcls_month', ''),
                        fin_co_no=option.get('fin_co_no', ''),
                        fin_prdt_cd=option.get('fin_prdt_cd', ''),
                        intr_rate_type=option.get('intr_rate_type', ''),
                        intr_rate_type_nm=option.get('intr_rate_type_nm', ''),
                        rsrv_type=option.get('rsrv_type', ''),
                        rsrv_type_nm=option.get('rsrv_type_nm', ''),
                        save_trm=option.get('save_trm', ''),
                        intr_rate=option.get('intr_rate', 0.0),
                        intr_rate2=option.get('intr_rate2', 0.0)
                    )

        self.stdout.write(self.style.SUCCESS('Successfully fetched and saved deposit products and their options'))
