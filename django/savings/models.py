from django.db import models
# 적금
class FinancialProduct(models.Model):
    fin_co_no = models.CharField(max_length=10)         # 금융회사코드
    fin_prdt_cd = models.CharField(max_length=50)       # 금융상품코드
    kor_co_nm = models.CharField(max_length=100)        # 금융회사명
    fin_prdt_nm = models.CharField(max_length=100)      # 금융상품명
    join_way = models.TextField()                       # 가입 방법
    mtrt_int = models.TextField()                       # 만기 후 이자율
    spcl_cnd = models.TextField()                       # 우대조건
    join_member = models.TextField()                    # 가입대상
    etc_note = models.TextField()                       # 기타 유의사항

    def __str__(self):
        return self.fin_prdt_nm

# 적금 옵션
class OptionList(models.Model):
    financial_product = models.ForeignKey(FinancialProduct, related_name='options', on_delete=models.CASCADE)
    fin_prdt_cd = models.CharField(max_length=50)                       # 금융 상품 코드
    intr_rate_type = models.CharField(max_length=1)                     # 저축 금리 유형
    intr_rate_type_nm = models.CharField(max_length=20)                 # 저축 금리 유형명
    rsrv_type = models.CharField(max_length=1, null=True)               # 적립 유형
    rsrv_type_nm = models.CharField(max_length=20, null=True)           # 저축 유형명
    save_trm = models.CharField(max_length=3)                           # 저축 기간(개월)
    intr_rate = models.FloatField(blank=True, null=True)                # 저축금리
    intr_rate2 = models.FloatField(blank=True, null=True)               # 최고 우대금리

    def __str__(self):
        return f"{self.fin_prdt_cd} - {self.intr_rate_type_nm}"
    