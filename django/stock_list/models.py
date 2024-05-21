from django.db import models

# Create your models here.
class PopularStock(models.Model):
    itemCode = models.CharField(max_length=6)                          # 주식 종목코드
    stockName =  models.CharField(max_length=50)                       # 주식 이름
    closePrice = models.CharField(max_length=10)                       # 현재 가격
    compareToPreviousClosePrice = models.CharField(max_length=10)      # 전날대비 변동 
    code = models.CharField(max_length=1)                              # 상승 하락 여부: 상승2, 보합3, 하락5 
    text = models.CharField(max_length=2)                              # 상승, 하락 여부 글자 표시