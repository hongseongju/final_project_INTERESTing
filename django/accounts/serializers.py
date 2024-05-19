from rest_framework import serializers
from dj_rest_auth.registration.serializers import RegisterSerializer
from dj_rest_auth.serializers import UserDetailsSerializer
from django.contrib.auth import get_user_model

UserModel = get_user_model()

class CustomRegisterSerializer(RegisterSerializer): # 사용자 회원가입
    email = serializers.EmailField(required=True)
    nickname = serializers.CharField(
        required=True,
        allow_blank=True,
        max_length=255
    )

    def get_cleaned_data(self): # 유효성 검사
        return {
            'username': self.validated_data.get('username', ''),
            'password1': self.validated_data.get('password1', ''),  
            'nickname': self.validated_data.get('nickname', ''),
            'email': self.validated_data.get('email', ''),
        }

class CustomUserDetailsSerializer(UserDetailsSerializer): # 사용자 프로필 정보 직렬화
    class Meta:
        model = UserModel
        fields = ['pk', 'username', 'email', 'nickname', 'cash']
        read_only_fields = ('email',)
