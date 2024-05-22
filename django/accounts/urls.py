from django.urls import path
from .views import charge_cash, change_nickname, CustomUserDetailsView, SubscribeSavingsView, SubscribeDepositView

urlpatterns = [
    path('charge-cash/', charge_cash, name='charge_cash'),
    path('change-nickname/', change_nickname, name='change_nickname'),
    path('user/', CustomUserDetailsView.as_view(), name='user-details'),
    path('subscribe_savings/', SubscribeSavingsView.as_view(), name='subscribe_savings'),
    path('subscribe_deposit/', SubscribeDepositView.as_view(), name='subscribe_deposit'),
    # 필요한 경우 다른 엔드포인트 추가...
]
