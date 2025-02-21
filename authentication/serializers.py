from rest_framework import serializers
from employees.models import Employee

class CustomEmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ['email', 'name']

class EmployeeCreateSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = Employee
        fields = ['email', 'name', 'password', "phone", "address"]