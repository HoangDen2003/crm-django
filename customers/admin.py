from django.contrib import admin
from .models import Customer

# Register your models here.
class CustomerAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone', 'address', 'created_at') 
    search_fields = ('name', 'email', 'phone', 'address')  
    # list_filter = ('address')  

admin.site.register(Customer, CustomerAdmin) 
