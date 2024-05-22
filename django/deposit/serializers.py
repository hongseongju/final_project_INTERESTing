from rest_framework import serializers
from .models import DepositProduct, OptionList

class DepositOptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = OptionList
        fields = '__all__'
        read_only_fields = ['deposit_product']

class DepositProductSerializer(serializers.ModelSerializer):
    options = DepositOptionSerializer(many=True, read_only=True)

    class Meta:
        model = DepositProduct
        fields = '__all__'