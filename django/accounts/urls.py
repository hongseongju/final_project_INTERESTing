from django.urls import path
from . import views

urlpatterns = [
    path('charge-cash/', views.charge_cash, name='charge_cash'),
    path('profile/update/', views.profile_update, name='profile-update'),
]
