from django.db import models

# from userApp.models import UserProfile


# Create your models here.
class Product(models.Model):
    name = models.CharField(max_length=100, unique=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()
    image_url = models.URLField()
    description = models.TextField()
