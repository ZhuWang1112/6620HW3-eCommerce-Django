# Generated by Django 4.1.7 on 2023-02-15 22:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('productApp', '0001_initial'),
        ('userApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField()),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='productApp.product')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userApp.userprofile')),
            ],
        ),
    ]
