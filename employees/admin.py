from django.contrib import admin
from .models import Employee

# Register your models here.
class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone', 'address', 'created_at') 
    search_fields = ('name', 'email', 'phone', 'address')  
    # list_filter = ('address')  

admin.site.register(Employee, EmployeeAdmin) 
