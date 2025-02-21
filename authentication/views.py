from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from .forms import LoginForm
from employees.models import Employee
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from .serializers import CustomEmployeeSerializer, EmployeeCreateSerializer
from .utils import generate_jwt, verify_jwt


# Create your views here.
@api_view(['POST'])
def login(request):
    if (request.method == 'POST'):
        email = request.data.get('email')
        password = request.data.get('password')

        # check email hoặc password có tồn tại không
        if not email or not password:
            return Response({
                'error': 'Email hoặc password không được để trống'
                }, status=status.HTTP_400_BAD_REQUEST)

        try:
            employee = Employee.objects.get(email=email)
            if employee.password == password:
                # Tạo JWT token

                token = generate_jwt(employee)

                return Response({
                    'status': 'success',
                    'code': status.HTTP_200_OK,
                    'message': 'Đăng nhập thành công',
                    'token': token
                    }, status=status.HTTP_200_OK)
        except Employee.DoesNotExist:
            return Response({
                'status': 'error',
                'code': status.HTTP_400_BAD_REQUEST,
                'message': 'Email không đúng'
                }, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def register(request):
    if request.method == 'POST':
        serializer = EmployeeCreateSerializer(data=request.data)
        if serializer.is_valid():
            # Lưu nhân viên vào cơ sở dữ liệu
            serializer.save()
            return Response({
                'status': 'success',
                'code': status.HTTP_201_CREATED,
                'message': 'Đăng ký thành công!',
                'result': serializer.data
            }, status=status.HTTP_201_CREATED)
        else:
            return Response({
                'status': 'error',
                'code': status.HTTP_400_BAD_REQUEST,
                'message': 'Dữ liệu không hợp lệ!',
                'errors': serializer.errors
            }, status=status.HTTP_400_BAD_REQUEST)