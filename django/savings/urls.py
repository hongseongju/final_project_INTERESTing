from django.urls import path
from . import views

urlpatterns = [
    path('', views.saving_rate),
    path('savings_detail/', views.savings_detail, name='savings_detail'),
]

