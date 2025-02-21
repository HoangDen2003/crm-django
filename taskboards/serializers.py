from rest_framework import serializers
from .models import TaskBoard
from employees.serializers import EmployeeGetSerializer

class TaskBoardGetSerializer(serializers.ModelSerializer):
    assigned_to = EmployeeGetSerializer()
    status = serializers.CharField(source='get_status_display')

    class Meta:
        model = TaskBoard
        fields = ['id', 'title', 'description', "status", "assigned_to"]

class TaskBoardCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = TaskBoard
        fields = ['title', 'description', "status", "assigned_to"]