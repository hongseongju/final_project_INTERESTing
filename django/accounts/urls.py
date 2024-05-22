from django.urls import path
from .views import charge_cash, change_nickname, CustomUserDetailsView

urlpatterns = [
    path('charge-cash/', charge_cash, name='charge_cash'),
    path('change-nickname/', change_nickname, name='change_nickname'),
    path('user/', CustomUserDetailsView.as_view(), name='user-details'),
    # 필요한 경우 다른 엔드포인트 추가...
]
