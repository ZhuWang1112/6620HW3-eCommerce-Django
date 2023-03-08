from rest_framework import serializers

from commentApp.models import Comment
from userApp.serializer import UserProfileSerializer


class CommentSerializer(serializers.ModelSerializer):
    user = UserProfileSerializer()
    class Meta:
        model = Comment
        fields = ['user', 'comment_time','content']