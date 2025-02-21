from rest_framework import serializers
from .models import Product

class ProductGetSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ['id', 'name', "price", "description"]

class ProductCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ['name', "price", "description"]