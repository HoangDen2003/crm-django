from django.contrib import admin
from .models import Product

# Register your models here.
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'price', 'created_at') 
    search_fields = ('name', 'description', 'price')  
    # list_filter = ('price')  

admin.site.register(Product, ProductAdmin) 
