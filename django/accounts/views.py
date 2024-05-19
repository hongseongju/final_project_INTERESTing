from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import generics
from .serializers import ProfileUpdateSerializer
from rest_framework.decorators import api_view, permission_classes
from django.contrib.auth import get_user_model
from .models import CustomUser

UserModel = get_user_model()

# 캐시 충전
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


# 프로필 업데이트
@api_view(['GET', 'PUT'])
@permission_classes([IsAuthenticated])
def profile_update(request):
    user = request.user
    if request.method == 'GET':
        serializer = ProfileUpdateSerializer(user)
        return Response(serializer.data)
    elif request.method == 'PUT':
        serializer = ProfileUpdateSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=400)
