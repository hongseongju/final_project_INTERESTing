from django.db import models

class FinancialProduct(models.Model):
    dcls_month = models.CharField(max_length=6)
    fin_co_no = models.CharField(max_length=10)
    fin_prdt_cd = models.CharField(max_length=50)
    kor_co_nm = models.CharField(max_length=100)
    fin_prdt_nm = models.CharField(max_length=100)
    join_way = models.TextField()
    mtrt_int = models.TextField()
    spcl_cnd = models.TextField()
    join_deny = models.CharField(max_length=1)
    join_member = models.TextField()
    etc_note = models.TextField()
    max_limit = models.BigIntegerField(null=True)
    dcls_strt_day = models.CharField(max_length=8)
    dcls_end_day = models.CharField(max_length=8, null=True)
    fin_co_subm_day = models.CharField(max_length=14)

    def __str__(self):
        return self.fin_prdt_nm


class OptionList(models.Model):
    financial_product = models.ForeignKey(FinancialProduct, related_name='options', on_delete=models.CASCADE)
    dcls_month = models.CharField(max_length=6)
    fin_co_no = models.CharField(max_length=10)
    fin_prdt_cd = models.CharField(max_length=50)
    intr_rate_type = models.CharField(max_length=1)
    intr_rate_type_nm = models.CharField(max_length=20)
    rsrv_type = models.CharField(max_length=1)
    rsrv_type_nm = models.CharField(max_length=20)
    save_trm = models.CharField(max_length=3)
    intr_rate = models.FloatField()
    intr_rate2 = models.FloatField()

    def __str__(self):
        return f"{self.fin_prdt_cd} - {self.intr_rate_type_nm}"