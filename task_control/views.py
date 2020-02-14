from django.shortcuts import render
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.views.generic.edit import FormMixin

from task_control.forms import CreateTaskForm, UpdateTaskForm, UpdateTaskStatusForm
from task_control.models import TaskModel, Status


class TaskList(ListView):
    template_name = 'task_control/index.html'
    model = TaskModel
    queryset = model.objects.all()
    ordering = 'status__order'
    context_object_name = 'tasks'

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(object_list=None, **kwargs)
        context.update({'create_form': CreateTaskForm,
                        'delete_form': DeleteTask,
                        'status_list': Status.objects.all()})
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


class DeleteTask(DeleteView):
    template_name = 'task_control/delete.html'
    success_url = '/'
