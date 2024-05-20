from rest_framework import serializers
from .models import Article, Comment

# 게시글 조회
class ArticleListSerializer(serializers.ModelSerializer):
    nickname = serializers.CharField(source='user.nickname', read_only=True)
    class Meta:
        model = Article
        fields = ('id', 'nickname', 'title', 'content',)

# 단일 게시글 데이터 조회
class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = '__all__'
        read_only_fields = ('user',)

# 댓글 목록 조회
class CommentSerializer(serializers.ModelSerializer):
    class ArticleTitleSerializer(serializers.ModelSerializer):
        class Meta:
            model = Article
            fields = ('title',)  
    article = ArticleTitleSerializer(read_only=True)  
    
    class Meta:
        model = Comment
        fields = '__all__'
        read_only_fields = ('article',)
