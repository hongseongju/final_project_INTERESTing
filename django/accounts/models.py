from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import AbstractUser
# from imagekit.models import ProcessedImageField
# from imagekit.processors import ResizeToFill
from django.core.validators import MinValueValidator
from allauth.account.adapter import DefaultAccountAdapter
from allauth.account.utils import user_email, user_field, user_username

# Create your models here.
class CustomUser(AbstractUser):
    nickname = models.CharField(max_length=100)
    # profile_image = models.ImageField(blank=True)
    cash = models.DecimalField(max_digits=10, decimal_places=2, default=0) 

class CustomAccountAdapter(DefaultAccountAdapter):
 def save_user(self, request, user, form, commit=True):
    data = form.cleaned_data
    first_name = data.get("first_name")
    last_name = data.get("last_name")
    email = data.get("email")
    username = data.get("username")
    # nickname 필드를 추가
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
    # Ability not to commit makes it easier to derive from
    # this adapter by adding    
        user.save()
    return user
