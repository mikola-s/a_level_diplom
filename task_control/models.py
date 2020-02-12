from django.contrib.auth.models import User
from django.db import models


class Status(models.Model):
    order = models.PositiveIntegerField()
    name = models.CharField(max_length=20)

    def __str__(self):
        return f"({self.order}) {self.name} "


class TaskModel(models.Model):
    title = models.CharField(max_length=50)
    owner = models.ForeignKey(to=User, on_delete=models.SET_DEFAULT, default=1, related_name='owner')
    worker = models.ForeignKey(to=User, on_delete=models.SET_NULL, null=True, blank=True, related_name='worker')
    status = models.ForeignKey(to=Status, on_delete=models.SET_DEFAULT, default=1)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"PK {self.pk} TITLE {self.title} OWNER {self.owner.username} STATUS {self.status.name}"
