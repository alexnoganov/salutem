from django.db import models
from django.contrib.auth.models import User


class Patients(models.Model):
    Sex = models.CharField(max_length=20, choices=(('Женский', 'Женский'), ('Мужской', 'Мужской')))
    Name = models.CharField(max_length=100)
    Surname = models.CharField(max_length=100)
    Patronymic = models.CharField(max_length=100)
    Position = models.CharField(max_length=50)
    Date_of_employment = models.DateField(blank=True)
    Inn = models.CharField(max_length=50, blank=True)
    Place_of_residence = models.CharField(max_length=100, blank=True)
    Telephone = models.CharField(max_length=100)
    Certificate = models.CharField(max_length=100)
    photo = models.CharField(max_length=30, blank=True)
    Email = models.CharField(max_length=30, blank=True)

    def __str__(self):
        return self.Name + self.Surname


class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    class Meta:
        permissions = (
            ('edit_tables', 'Может редактировать таблицы'),
            ('add_lesson', 'Может добавлять занятие'),
            ('add_workout', 'Может добавлять отработку/отмену'),
            ('view_schedule', 'Может просматривать расписание')
        )
