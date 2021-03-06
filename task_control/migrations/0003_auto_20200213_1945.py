# Generated by Django 2.2 on 2020-02-13 17:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('task_control', '0002_auto_20200210_0049'),
    ]

    operations = [
        migrations.AlterField(
            model_name='status',
            name='order',
            field=models.PositiveIntegerField(unique=True),
        ),
        migrations.AlterField(
            model_name='taskmodel',
            name='status',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.SET_DEFAULT, related_name='status', to='task_control.Status', to_field='order'),
        ),
    ]
