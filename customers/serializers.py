from rest_framework import serializers
from .models import Customer

class CustomerGetSerializer(serializers.ModelSerializer):

    class Meta:
        model = Customer
        fields = ['id', 'email', 'name', "phone", "address"]

class CustomerCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Customer
        fields = ['email', 'name', "phone", "address"]