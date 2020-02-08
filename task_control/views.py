from django.shortcuts import render
from django.views.generic import ListView, CreateView, UpdateView, DeleteView

from task_control.forms import CreateTaskForm
from task_control.models import TaskModel


class TaskList(ListView):
    template_name = 'task_control/index.html'
    model = TaskModel
    queryset = model.objects.all()
    ordering = 'status__order'

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(object_list=None, **kwargs)
        context.update({'create_form': CreateTaskForm})
        return context


class CreateTask(CreateView):
    template_name = 'task_control/create.html'
    success_url = '/'


class UpdateTask(UpdateView):
    template_name = 'task_control/update.html'
    success_url = '/'


class DeleteTask(DeleteView):
    template_name = 'task_control/delete.html'
    success_url = '/'
