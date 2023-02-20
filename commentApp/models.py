from django.db import models

from productApp.models import Product
from userApp.models import UserProfile


# Create your models here.
class Comment(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    comment_time = models.DateTimeField(auto_now_add=True)
    content = models.TextField()