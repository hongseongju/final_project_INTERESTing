from django.urls import path
from . import views

urlpatterns = [
    path('articles/', views.article_list_create, name='article_list_create'),  # 목록 조회 및 생성
    path('articles/<int:article_pk>/', views.article_detail_delete, name='article_detail_delete'),  # 단일 게시글 조회 및 삭제
]
