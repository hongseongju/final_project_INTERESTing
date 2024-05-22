from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import MinValueValidator
from allauth.account.adapter import DefaultAccountAdapter
from allauth.account.utils import user_email, user_field, user_username

# 사용자 모델 정의
class CustomUser(AbstractUser):
    nickname = models.CharField(max_length=100)
    cash = models.DecimalField(max_digits=10, decimal_places=2, default=0)

# 사용자 가입 어댑터 정의
class CustomAccountAdapter(DefaultAccountAdapter):
    def save_user(self, request, user, form, commit=True):
        data = form.cleaned_data
        first_name = data.get("first_name")
        last_name = data.get("last_name")
        email = data.get("email")
        username = data.get("username")
        nickname = data.get("nickname")
        user_email(user, email)
        user_username(user, username)
        if first_name:
            user_field(user, "first_name", first_name)
        if last_name:
            user_field(user, "last_name", last_name)
        if nickname:
            user_field(user, "nickname", nickname)
        if "password1" in data:
            user.set_password(data["password1"])
        else:
            user.set_unusable_password()
        self.populate_username(request, user)
        if commit:
            user.save()
        return user

# 사용자 가입 정보 모델 정의
class Subscription(models.Model):
    user = models.ForeignKey(CustomUser, related_name='subscriptions', on_delete=models.CASCADE)
    product_name = models.CharField(max_length=100)
    bank_name = models.CharField(max_length=100)
    interest_type = models.CharField(max_length=20)
    save_term = models.CharField(max_length=3)
    interest_rate = models.FloatField(blank=True, null=True)
    max_interest_rate = models.FloatField(blank=True, null=True)
    product_type = models.CharField(max_length=10)

    def __str__(self):
        return f"{self.user.username} - {self.product_name}"
