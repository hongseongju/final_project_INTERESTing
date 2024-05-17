import requests
from django.core.management.base import BaseCommand
from savings.models import FinancialProduct, OptionList

class Command(BaseCommand):
    help = 'Fetch financial products from API and save to database'

    def handle(self, *args, **options):
        API_KEY = 'cafcfc26852ccb85dc3ddd0807a92f24'
        url = f'http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json?auth={API_KEY}&topFinGrpNo=020000&pageNo=1'

        response = requests.get(url)
        response.raise_for_status()  # HTTP 에러 발생 시 예외 발생
        financial_products_data = response.json()['result']

        base_list = financial_products_data.get('baseList', [])
        option_list = financial_products_data.get('optionList', [])

        for product in base_list:
            financial_product, created = FinancialProduct.objects.get_or_create(
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
                if option['fin_prdt_cd'] == financial_product.fin_prdt_cd:
                    OptionList.objects.get_or_create(
                        financial_product=financial_product,
                        dcls_month=option['dcls_month'],
                        fin_co_no=option['fin_co_no'],
                        fin_prdt_cd=option['fin_prdt_cd'],
                        intr_rate_type=option['intr_rate_type'],
                        intr_rate_type_nm=option['intr_rate_type_nm'],
                        rsrv_type=option['rsrv_type'],
                        rsrv_type_nm=option['rsrv_type_nm'],
                        save_trm=option['save_trm'],
                        intr_rate=option['intr_rate'],
                        intr_rate2=option['intr_rate2']
                    )

        self.stdout.write(self.style.SUCCESS('Successfully fetched and saved financial products and their options'))
        