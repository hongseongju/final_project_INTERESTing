from rest_framework import serializers
from .models import PopularStock

class PopularStockSerializer(serializers.ModelSerializer):
    class Meta:
        model = PopularStock
        fields = '__all__'