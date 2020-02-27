from rest_framework.serializers import ModelSerializer
from .models import TaskModel, Status
from rest_framework import serializers


class TaskSerializer(ModelSerializer):
    class Meta:
        model = TaskModel
        fields = ('id', 'title', 'owner', 'worker', 'status')


class FilterStatusSerializer(serializers.Serializer):
    status = serializers.CharField()
    owner = serializers.CharField()
    worker = serializers.CharField()
    update_time = serializers.DateTimeField()
