from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.views import LoginView, LogoutView
from django.views.generic import CreateView
from django.contrib import messages


class UserRegister(SuccessMessageMixin, CreateView):
    """ create user form page '/user_create/' """

    template_name = 'identify/create.html'
    success_url = '/'
    form_class = UserCreationForm
    success_message = 'Create user %(username)s successful'

    def form_valid(self, form):
        form_data = super().form_valid(form)
        username = self.request.POST['username']
        password = self.request.POST['password1']
        user = authenticate(username=username, password=password)
        login(self.request, user)
        return form_data


class UserLogin(SuccessMessageMixin, LoginView):
    """ login user form page '/user_login/' """

    template_name = 'identify/login.html'
    success_url = '/'
    success_message = '%(username)s login successfully'


class UserLogout(SuccessMessageMixin, LogoutView):
    """ user logout """

    template_name = 'identify/logout.html'
    next_page = '/'

    def dispatch(self, request, *args, **kwargs):
        messages.add_message(self.request, messages.SUCCESS,
                             f'{self.request.user.username} logout successfully')
        return super().dispatch(request, *args, **kwargs)
