# Generated by Django 4.1.7 on 2023-02-16 03:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('productApp', '0002_product_description'),
        ('userApp', '0001_initial'),
        ('cartApp', '0001_initial'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='cart',
            unique_together={('user', 'product')},
        ),
    ]
