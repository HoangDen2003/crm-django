# Generated by Django 5.2b1 on 2025-02-21 04:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0002_employee_is_active'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employee',
            name='is_active',
        ),
    ]
