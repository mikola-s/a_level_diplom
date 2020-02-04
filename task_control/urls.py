from django.urls import path
from . import views

app_name = 'task_control'

urlpatterns = [
    path('', views.Index.as_view(), name='index')
]
