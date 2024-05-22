from rest_framework import serializers
from .models import FinancialProduct, OptionList
from .models import DepositProduct, DepositOption

class SavingsProductsSerializer(serializers.ModelSerializer):
    class Meta:
        model = FinancialProduct
        fields = '__all__'
        
class  SavingsOptionsSerializer(serializers.ModelSerializer):
    financial_product = serializers.ReadOnlyField(source='product.fin_prdt_cd')
    class Meta:
        model = OptionList
        fields = '__all__'


class DepositOptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepositOption
        fields = '__all__'
        read_only_fields = ['deposit_product']

class DepositProductSerializer(serializers.ModelSerializer):
    options = DepositOptionSerializer(many=True, read_only=True)

    class Meta:
        model = DepositProduct
        fields = '__all__'