from django.shortcuts import render
from .models import TaskBoard
from .serializers import TaskBoardGetSerializer, TaskBoardCreateSerializer
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from django.views.decorators.csrf import csrf_exempt
from drf_spectacular.utils import extend_schema

# Create your views here.
@extend_schema(summary="API get all tasks, filter by status and assignor's name", description="Một API đơn giản trả về JSON")
@api_view(['GET'])
@csrf_exempt
@permission_classes([IsAuthenticated])
def index(request):
    search = request.GET.get('search', '')

    tasks = TaskBoard.objects.select_related("assigned_to").all()
    
    if search:  # Nếu có search trong request, lọc dữ liệu
        tasks = tasks.filter(
            status__icontains=search
        ) | tasks.filter(
            assigned_to__name__icontains=search
        )
    return Response({
        'status': status.HTTP_200_OK,
        'message': 'Get all tasks',
        'data': TaskBoardGetSerializer(tasks, many=True).data
    }, status=status.HTTP_200_OK)

@api_view(['POST'])
@csrf_exempt
@permission_classes([IsAuthenticated])
def create(request):
    if request.method == 'POST':
        serializer = TaskBoardCreateSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'status': status.HTTP_201_CREATED,
                'message': 'Create task successfully!',
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
            task = TaskBoard.objects.get(id=id)
        except TaskBoard.DoesNotExist:
            return Response({
                'status': status.HTTP_404_NOT_FOUND,
                'message': 'Task not found!'
            }, status=status.HTTP_404_NOT_FOUND)
        serializer = TaskBoardCreateSerializer(task, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'status': status.HTTP_200_OK,
                'message': 'Update task successfully',
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
            task = TaskBoard.objects.get(id=id)
        except TaskBoard.DoesNotExist:
            return Response({
                'status': status.HTTP_404_NOT_FOUND,
                'message': 'Task not found!'
            }, status=status.HTTP_404_NOT_FOUND)
        task.delete()
        return Response({
            'status': status.HTTP_204_NO_CONTENT,
            'message': 'Delete task successfully'
        }, status=status.HTTP_204_NO_CONTENT,)