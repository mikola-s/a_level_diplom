from django.contrib.auth.models import User
from django.shortcuts import render
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.views.generic.edit import FormMixin

from task_control.forms import CreateTaskForm, UpdateTaskForm, UpdateTaskStatusForm
from task_control.models import TaskModel, Status


class TaskList(ListView):
    template_name = 'task_control/index.html'
    model = TaskModel
    queryset = model.objects.all()
    ordering = ['status__order', '-update_time']
    context_object_name = 'tasks'

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(object_list=None, **kwargs)
        worker_list = User.objects.exclude(id=1).filter(is_staff=False)
        context.update({'create_form': CreateTaskForm,
                        'delete_form': DeleteTask,
                        'status_list': Status.objects.all(),
                        'worker_list': worker_list,
                        })
        return context


class CreateTask(CreateView):
    form_class = CreateTaskForm
    model = TaskModel
    template_name = 'task_control/create.html'
    success_url = '/'

    def form_valid(self, form):
        form_patch = form.save(commit=False)
        form_patch.owner_id = self.request.user.id
        if form.cleaned_data['worker']:
            form_patch.worker = self.request.user
            form_patch.worker_id = self.request.user.id
        return super().form_valid(form)

    def form_invalid(self, form):
        return super().form_invalid(form)


class UpdateTaskStatus(UpdateView):
    template_name = 'task_control/update.html'
    success_url = '/'
    fields = ['status', ]
    model = TaskModel


class UpdateTaskTitle(UpdateView):
    template_name = 'task_control/update.html'
    success_url = '/'
    fields = ['title', ]
    model = TaskModel


class UpdateTaskWorker(UpdateView):
    template_name = 'task_control/update.html'
    success_url = '/'
    fields = ['worker', ]
    model = TaskModel

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)


class DeleteTask(DeleteView):
    model = TaskModel
    template_name = 'task_control/delete.html'
    success_url = '/'
