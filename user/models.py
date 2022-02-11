from django.db import models
from django.contrib.auth.models import User


class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    class Meta:
        permissions = (
            ('edit_tables', 'Может редактировать таблицы'),
            ('add_lesson', 'Может добавлять занятие'),
            ('add_workout', 'Может добавлять отработку/отмену'),
            ('view_schedule', 'Может просматривать расписание')
        )
