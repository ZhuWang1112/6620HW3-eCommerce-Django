from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractUser

from productApp.models import Product


class UserProfile(models.Model):
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=128)


