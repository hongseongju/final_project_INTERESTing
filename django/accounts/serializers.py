from rest_framework import serializers
from .models import CustomUser, Subscription
from dj_rest_auth.registration.serializers import RegisterSerializer
from dj_rest_auth.serializers import UserDetailsSerializer

class CustomRegisterSerializer(RegisterSerializer):
    email = serializers.EmailField(required=True)
    nickname = serializers.CharField(
        required=True,
        allow_blank=True,
        max_length=255
    )

    def get_cleaned_data(self):
        return {
            'username': self.validated_data.get('username', ''),
            'password1': self.validated_data.get('password1', ''),
            'nickname': self.validated_data.get('nickname', ''),
            'email': self.validated_data.get('email', ''),
        }

class SubscriptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subscription
        fields = ['product_name', 'bank_name', 'interest_type', 'save_term', 'interest_rate', 'max_interest_rate', 'product_type']

class CustomUserDetailsSerializer(UserDetailsSerializer):
    savings_subscriptions = serializers.SerializerMethodField()
    deposit_subscriptions = serializers.SerializerMethodField()
    
    class Meta:
        model = CustomUser
        fields = ['pk', 'id', 'username', 'email', 'nickname', 'cash', 'savings_subscriptions', 'deposit_subscriptions']
        read_only_fields = ('email',)

    def get_savings_subscriptions(self, obj):
        subscriptions = obj.subscriptions.filter(product_type='savings')
        return SubscriptionSerializer(subscriptions, many=True).data

    def get_deposit_subscriptions(self, obj):
        subscriptions = obj.subscriptions.filter(product_type='deposit')
        return SubscriptionSerializer(subscriptions, many=True).data