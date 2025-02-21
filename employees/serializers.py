from rest_framework import serializers
from .models import Employee

class EmployeeGetSerializer(serializers.ModelSerializer):

    class Meta:
        model = Employee
        fields = ['id', 'email', 'name', "phone", "address"]

class EmployeeCreateSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = Employee
        fields = ['email', 'name', "phone", "address", "password"]