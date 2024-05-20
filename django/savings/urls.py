from django.urls import path
from . import views

urlpatterns = [
    path('', views.saving_rate),
    path('deposit/', views.deposit_rate),
    path('savings_detail/', views.savings_detail, name='savings_detail'),
    path('deposit_detail/', views.deposit_detail, name='deposit_detail'),
]

