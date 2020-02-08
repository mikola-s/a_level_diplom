from django.urls import path
from . import views

app_name = 'task_control'

urlpatterns = [
    path('', views.TaskList.as_view(), name='index'),
    path('create/', views.CreateTask.as_view(), name='index'),
]
