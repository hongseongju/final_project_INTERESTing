from django.urls import path
from . import views

urlpatterns = [
    path('', views.saving_rate)
]