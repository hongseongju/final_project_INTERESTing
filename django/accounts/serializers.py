from rest_framework import serializers
from dj_rest_auth.registration.serializers import RegisterSerializer
from dj_rest_auth.serializers import UserDetailsSerializer
from .models import User
from django.contrib.auth import get_user_model
UserModel = get_user_model()

class CustomRegisterSerializer(RegisterSerializer):
 # 필요한 필드들을 추가합니다.
  email = serializers.EmailField(required=True)
  nickname = serializers.CharField(
  required=True,
  allow_blank=True,
  max_length=255
 )
  cash = serializers.IntegerField(required=True)
  
 # 해당 필드도 저장 시 함께 사용하도록 설정합니다.
  def get_cleaned_data(self):
    return {
      'username': self.validated_data.get('username', ''),
      'password1': self.validated_data.get('password1', ''),
      'nickname': self.validated_data.get('nickname', ''),
      'email' : self.validated_data.get('email', ''),
      'cash' : self.validated_data.get('cash', ''),
 }



class CustomUserDetailsSerializer(UserDetailsSerializer):
  class Meta:
    extra_fields = []
    if hasattr(UserModel, 'USERNAME_FIELD'):
      extra_fields.append(UserModel.USERNAME_FIELD)
    if hasattr(UserModel, 'EMAIL_FIELD'):
      extra_fields.append(UserModel.EMAIL_FIELD)
    if hasattr(UserModel, 'first_name'):
      extra_fields.append('first_name')
    if hasattr(UserModel, 'last_name'):
      extra_fields.append('last_name')
    if hasattr(UserModel, 'nickname'):
      extra_fields.append('nickname') 
      model = UserModel
      fields = ('pk', *extra_fields)
      read_only_fields = ('email',)
    if hasattr(UserModel, 'cash'):
      extra_fields.append('cash')