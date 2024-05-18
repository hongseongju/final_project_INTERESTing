from django.urls import path
from . import views

urlpatterns = [
    path('charge-cash/', views.charge_cash, name='charge_cash'),
]
