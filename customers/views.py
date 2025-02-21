from django.shortcuts import render
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .serializers import CustomerCreateSerializer, CustomerGetSerializer
from .models import Customer
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.csrf import csrf_protect
from rest_framework.permissions import AllowAny
from rest_framework.authentication import TokenAuthentication
from rest_framework.viewsets import ModelViewSet
from drf_spectacular.utils import extend_schema

class SampleViewSet(ModelViewSet):
    queryset = Customer.objects.all()
    serializer_class = CustomerGetSerializer

    @extend_schema(summary="Get customers", description="API để lấy dữ liệu mẫu")
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

# Create your views here.
@extend_schema(summary="API Get all customers", description="Một API đơn giản trả về JSON")
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def index(request):
    print("Token từ request:", request.headers.get("Authorization"))
    print("User hiện tại:", request.user)
    customers = Customer.objects.all()
    return Response({
        'status': status.HTTP_200_OK,
        'message': 'Get all customers',
        'data': CustomerGetSerializer(customers, many=True).data
    }, status=status.HTTP_200_OK)

@csrf_exempt
@api_view(['POST'])
# @authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
# @csrf_exempt # Bỏ qua kiểm tra CSRF
def create(request):
    if request.method == 'POST':
        serializer = CustomerCreateSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'status': status.HTTP_201_CREATED,
                'message': 'Đăng ký thành công!',
                'result': serializer.data
            }, status=status.HTTP_201_CREATED)
        else:
            return Response({
                'status': status.HTTP_400_BAD_REQUEST,
                'message': 'Dữ liệu không hợp lệ!',
                'errors': serializer.errors
            }, status=status.HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update(request, id):
    if request.method == 'PUT':
        try:
            customer = Customer.objects.get(id=id)
        except Customer.DoesNotExist:
            return Response({
                'status': status.HTTP_404_NOT_FOUND,
                'message': 'Customer not found!'
            }, status=status.HTTP_404_NOT_FOUND)
        serializer = CustomerCreateSerializer(customer, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'status': status.HTTP_200_OK,
                'message': 'Update customer successfully',
                'result': serializer.data
            }, status=status.HTTP_200_OK)
        else:
            return Response({
                'status': status.HTTP_400_BAD_REQUEST,
                'message': 'Invalid data!',
                'errors': serializer.errors
            }, status=status.HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete(request, id):
    if request.method == 'DELETE':
        try:
            customer = Customer.objects.get(id=id)
        except Customer.DoesNotExist:
            return Response({
                'status': status.HTTP_404_NOT_FOUND,
                'message': 'Customer not found!'
            }, status=status.HTTP_404_NOT_FOUND)
        customer.delete()
        return Response({
            'status': status.HTTP_204_NO_CONTENT,
            'message': 'Delete customer successfully'
        }, status=status.HTTP_204_NO_CONTENT)