from django.urls import path
from . import views

urlpatterns = [
    path('', views.deposit_rate),
    path('deposit_detail/', views.deposit_detail, name='deposit_detail'),
]

