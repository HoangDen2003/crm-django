from django.shortcuts import render
from .models import Product
from .serializers import ProductGetSerializer, ProductCreateSerializer
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from django.views.decorators.csrf import csrf_exempt

# Create your views here.
@api_view(['GET'])
@csrf_exempt
@permission_classes([IsAuthenticated])
def index(request):
    products = Product.objects.all()
    return Response({
        'status': status.HTTP_200_OK,
        'message': 'Get all products',
        'data': ProductGetSerializer(products, many=True).data
    }, status=status.HTTP_200_OK)

@api_view(['POST'])
@csrf_exempt
@permission_classes([IsAuthenticated])
def create(request):
    if request.method == 'POST':
        serializer = ProductCreateSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'status': status.HTTP_201_CREATED,
                'message': 'Create a product successfully!',
                'result': serializer.data
            }, status=status.HTTP_201_CREATED)
        else:
            return Response({
                'status': status.HTTP_400_BAD_REQUEST,
                'message': 'Invalid data!',
                'errors': serializer.errors
            }, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
@csrf_exempt
@permission_classes([IsAuthenticated])
def update(request, id):
    if request.method == 'PUT':
        try:
            product = Product.objects.get(id=id)
        except Product.DoesNotExist:
            return Response({
                'status': status.HTTP_404_NOT_FOUND,
                'message': 'Product not found!'
            }, status=status.HTTP_404_NOT_FOUND)
        serializer = ProductCreateSerializer(product, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'status': status.HTTP_200_OK,
                'message': 'Update product successfully',
                'result': serializer.data
            }, status=status.HTTP_200_OK)
        else:
            return Response({
                'status': status.HTTP_400_BAD_REQUEST,
                'message': 'Invalid data!',
                'errors': serializer.errors
            }, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
@csrf_exempt
@permission_classes([IsAuthenticated])
def delete(request, id):
    if request.method == 'DELETE':
        try:
            product = Product.objects.get(id=id)
        except Product.DoesNotExist:
            return Response({
                'status': status.HTTP_404_NOT_FOUND,
                'message': 'Product not found!'
            }, status=status.HTTP_404_NOT_FOUND)
        product.delete()
        return Response({
            'status': status.HTTP_204_NO_CONTENT,
            'message': 'Delete product successfully'
        }, status=status.HTTP_204_NO_CONTENT)