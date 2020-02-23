from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth.models import User
from django.shortcuts import render
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.views.generic.edit import FormMixin

from task_control.forms import CreateTaskForm, UpdateTaskForm, UpdateTaskStatusForm
from task_control.models import TaskModel, Status
from django.contrib import messages


class TaskList(SuccessMessageMixin, ListView):
    template_name = 'task_control/index.html'
    model = TaskModel
    queryset = model.objects.all()
    ordering = ['status__order', '-update_time']
    context_object_name = 'tasks'

    def set_session_lifetime(self):
        if not self.request.user.is_superuser:
            self.request.session.set_expiry(5)

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(object_list=None, **kwargs)
        worker_list = User.objects.exclude(id=1).filter(is_staff=False)
        self.set_session_lifetime()
        context.update({'create_form': CreateTaskForm,
                        'delete_form': DeleteTask,
                        'status_list': Status.objects.all(),
                        'worker_list': worker_list,
                        })
        return context


class CreateTask(SuccessMessageMixin, CreateView):
    form_class = CreateTaskForm
    model = TaskModel
    template_name = 'task_control/create.html'
    success_url = '/'
    success_message = 'Create task %(title)s successful'

    def form_valid(self, form):
        form_patch = form.save(commit=False)
        form_patch.owner_id = self.request.user.id
        if form.cleaned_data['worker']:
            form_patch.worker = self.request.user
            form_patch.worker_id = self.request.user.id
        return super().form_valid(form)

    def form_invalid(self, form):
        return super().form_invalid(form)


class UpdateTaskStatus(SuccessMessageMixin, UpdateView):
    template_name = 'task_control/update.html'
    success_url = '/'
    fields = ['status', ]
    model = TaskModel

    def get_success_message(self, cleaned_data):
        task = self.object
        self.success_message = f'Change task ({task.pk}) to status "{task.status.name}" success'
        return super().get_success_message(cleaned_data)


class UpdateTaskTitle(SuccessMessageMixin, UpdateView):
    template_name = 'task_control/update.html'
    success_url = '/'
    fields = ['title', ]
    model = TaskModel

    def get_success_message(self, cleaned_data):
        task = self.object
        self.success_message = f'Change task ({task.pk}) title to "%(title)s" success'
        return super().get_success_message(cleaned_data)


class UpdateTaskWorker(SuccessMessageMixin, UpdateView):
    template_name = 'task_control/update.html'
    success_url = '/'
    fields = ['worker', ]
    model = TaskModel

    def get_success_message(self, cleaned_data):
        task = self.object
        self.success_message = f'Task ({task.pk}) worker -- %(worker)s'
        return super().get_success_message(cleaned_data)


class DeleteTask(SuccessMessageMixin, DeleteView):
    model = TaskModel
    template_name = 'task_control/delete.html'
    success_url = '/'

    def dispatch(self, request, *args, **kwargs):
        task = self.kwargs['pk']
        messages.add_message(self.request, messages.SUCCESS, f'Task ({task}) delete success')
        return super().dispatch(request, *args, **kwargs)

    def get_success_message(self, cleaned_data):
        task = self.object
        self.success_message = f'Task ({task.pk}) delete success'
        return super().get_success_message(cleaned_data)
