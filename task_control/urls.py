from django.urls import path
from . import views

app_name = 'task_control'

urlpatterns = [
    path('', views.TaskList.as_view(), name='index'),
    path('create/task/', views.CreateTask.as_view(), name='create'),
    path('update/task/<int:pk>/status', views.UpdateTaskStatus.as_view(), name='update_status'),
    path('update/task/<int:pk>/title', views.UpdateTaskTitle.as_view(), name='update_title'),
    path('update/task/<int:pk>/worker', views.UpdateTaskWorker.as_view(), name='update_worker'),
    path('delete/task/<int:pk>', views.DeleteTask.as_view(), name='delete'),
]
