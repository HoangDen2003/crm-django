from django.db import models
from employees.models import Employee

# Create your models here.
class TaskBoard(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100)
    description = models.TextField()
    status = models.CharField(
        max_length=10,
        choices=[
            ('TD', 'To Do'),
            ('IP', 'In Progress'),
            ('DN', 'Done')
        ],
        default='TD'
    )
    assigned_to = models.ForeignKey(Employee, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.title} - {self.assigned_to.name} - {self.status}"
