from rest_framework import serializers

from productApp.serializers import ProductSerializer
from .models import Cart


class CartSerializer(serializers.ModelSerializer):
    total_price = serializers.SerializerMethodField()
    product = ProductSerializer()

    class Meta:
        model = Cart
        fields = ['id', 'user', 'product', 'quantity', 'total_price']

    def get_total_price(self, obj):
        return obj.quantity * obj.product.price
