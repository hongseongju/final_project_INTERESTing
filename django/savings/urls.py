from django.urls import path
from . import views

urlpatterns = [
    path('', views.saving_rate),
    path('deposit/', views.deposit_rate),
    path('financial-products/', views.financial_products, name='financial_products'),
]

