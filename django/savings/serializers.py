from rest_framework import serializers
from .models import FinancialProduct, OptionList

class SavingsProductsSerializer(serializers.ModelSerializer):
    class Meta:
        model = FinancialProduct
        fields = '__all__'
        
class  SavingsOptionsSerializer(serializers.ModelSerializer):
    financial_product = serializers.ReadOnlyField(source='product.fin_prdt_cd')
    class Meta:
        model = OptionList
        fields = '__all__'
