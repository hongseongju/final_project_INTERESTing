from django.db import models

# Create your models here.
class Exchange(models.Model):
    cur_nm = models.CharField(max_length=100)                             # 국가/통화명
    cur_unit = models.CharField(max_length=10)                            # 통화코드
    deal_bas_r = models.DecimalField(max_digits=10, decimal_places=2)     # 매매기준율
    ttb = models.DecimalField(max_digits=10, decimal_places=2)            # 송금 받을때