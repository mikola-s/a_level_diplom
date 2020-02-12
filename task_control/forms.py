from django import forms

from task_control.models import TaskModel


class CreateTaskForm(forms.ModelForm):
    class Meta:
        model = TaskModel
        fields = ['title']

    # title = forms.CharField(max_length=50, label='', label_suffix='')
    worker = forms.BooleanField(initial=False, label="I will do", label_suffix='', required=False)
