from django.shortcuts import render
from django.views.generic.base import TemplateView


class Index(TemplateView):
    template_name = 'task_control/index.html'


