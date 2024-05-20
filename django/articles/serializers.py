from rest_framework import serializers
from .models import Article



# 게시글 조회
class ArticleListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ('nickname', 'title', 'content',)

# 단일 게시글 데이터 조회
class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = '__all__'
