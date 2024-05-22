from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .models import CustomUser
from dj_rest_auth.views import UserDetailsView
from .serializers import CustomUserDetailsSerializer
from rest_framework.views import APIView
from rest_framework import status
from django.contrib.auth import get_user_model
from .models import Subscription
from savings.models import OptionList as SavingsOptionList
from deposit.models import OptionList as DepositOptionList
User = get_user_model()


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def charge_cash(request):
    try:
        amount = int(request.data.get('amount'))  # 정수로 변환
    except (TypeError, ValueError):
        return Response({'error': 'Invalid amount'}, status=400)

    if amount <= 0:
        return Response({'error': 'Amount must be greater than zero'}, status=400)

    user = request.user
    user.cash += amount
    user.save()

    return Response({'message': 'Cash charged successfully', 'amount': amount})

@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def change_nickname(request):
    new_nickname = request.data.get('nickname')
    if not new_nickname:
        return Response({"error": "Nickname is required"}, status=400)

    user = request.user
    user.nickname = new_nickname
    user.save()

    return Response({"success": "Nickname changed successfully"}, status=200)



class CustomUserDetailsView(UserDetailsView):
    serializer_class = CustomUserDetailsSerializer

class SubscribeSavingsView(APIView):
    def post(self, request):
        option_id = request.data.get('option_id')
        user_id = request.data.get('user_id')

        try:
            option = SavingsOptionList.objects.get(id=option_id)
            user = User.objects.get(id=user_id)

            Subscription.objects.create(
                user=user,
                product_name=option.fin_prdt_cd,
                bank_name=option.financial_product.kor_co_nm,
                interest_type=option.intr_rate_type_nm,
                save_term=option.save_trm,
                interest_rate=option.intr_rate,
                max_interest_rate=option.intr_rate2,
                product_type='savings'
            )
            return Response({'status': 'success'}, status=status.HTTP_200_OK)
        except SavingsOptionList.DoesNotExist:
            return Response({'error': 'Option not found'}, status=status.HTTP_404_NOT_FOUND)
        except User.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class SubscribeDepositView(APIView):
    def post(self, request):
        option_id = request.data.get('option_id')
        user_id = request.data.get('user_id')

        try:
            option = DepositOptionList.objects.get(id=option_id)
            user = User.objects.get(id=user_id)

            Subscription.objects.create(
                user=user,
                product_name=option.fin_prdt_cd,
                bank_name=option.deposit_product.kor_co_nm,
                interest_type=option.intr_rate_type_nm,
                save_term=option.save_trm,
                interest_rate=option.intr_rate,
                max_interest_rate=option.intr_rate2,
                product_type='deposit'
            )
            return Response({'status': 'success'}, status=status.HTTP_200_OK)
        except DepositOptionList.DoesNotExist:
            return Response({'error': 'Option not found'}, status=status.HTTP_404_NOT_FOUND)
        except User.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)