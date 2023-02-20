from django.db import models

from userApp.models import UserProfile


# Create your models here.
class Order(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    order_time = models.DateTimeField(auto_now_add=True)
    total_price = models.DecimalField(max_digits=10, decimal_places=2)

# class Order