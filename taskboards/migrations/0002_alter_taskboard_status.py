# Generated by Django 5.2b1 on 2025-02-20 21:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('taskboards', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='taskboard',
            name='status',
            field=models.CharField(choices=[('TD', 'To Do'), ('IP', 'In Progress'), ('DN', 'Done')], default='TD', max_length=10),
        ),
    ]
