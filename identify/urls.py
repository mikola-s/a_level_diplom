from django.urls import path
from .views import UserRegister, UserLogin, UserLogout

app_name = 'identify'

urlpatterns = [
    path('register/', UserRegister.as_view(), name='register'),
    path('login/', UserLogin.as_view(), name='login'),
    path('logout/', UserLogout.as_view(), name='logout'),
]
