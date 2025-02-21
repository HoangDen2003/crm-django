from django.contrib import admin
from .models import TaskBoard

# Register your models here.

class TaskBoardAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'status', 'assigned_to', 'created_at')  # Hiển thị cột
    search_fields = ('title', 'assigned_to__name', 'status', 'description')  # Tìm kiếm theo tiêu đề, nhân viên, status
    list_filter = ('status', 'assigned_to__name')  # Lọc theo status, nhân viên

admin.site.register(TaskBoard, TaskBoardAdmin) 
