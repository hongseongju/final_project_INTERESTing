from rest_framework import serializers
from .models import Article, Comment
from accounts.serializers import CustomUserDetailsSerializer

# 게시글 조회
class ArticleListSerializer(serializers.ModelSerializer):
    nickname = serializers.CharField(source='user.nickname', read_only=True)
    class Meta:
        model = Article
        fields = ('id', 'nickname', 'title', 'content', 'user',)

# 단일 게시글 데이터 조회
class ArticleSerializer(serializers.ModelSerializer):
    nickname = serializers.CharField(source='user.nickname', read_only=True)
    user = CustomUserDetailsSerializer(read_only=True)  # 사용자 정보 포함

    class CommentSerializer(serializers.ModelSerializer):
        nickname = serializers.CharField(source='user.nickname', read_only=True)
        user = CustomUserDetailsSerializer(read_only=True)  # 사용자 정보 포함

        class Meta:
            model = Comment
            fields = '__all__'
            read_only_fields = ('user',)

    comment_set = CommentSerializer(read_only=True, many=True)
    
    class Meta:
        model = Article
        fields = '__all__'
        read_only_fields = ('user',)

# 댓글 목록 조회
class CommentSerializer(serializers.ModelSerializer):
    nickname = serializers.CharField(source='user.nickname', read_only=True)
    user = CustomUserDetailsSerializer(read_only=True)  # 사용자 정보 포함

    class ArticleTitleSerializer(serializers.ModelSerializer):
        class Meta:
            model = Article
            fields = ('title',)  
    article = ArticleTitleSerializer(read_only=True)
    
    class Meta:
        model = Comment
        fields = '__all__'
        read_only_fields = ('article', 'user')
