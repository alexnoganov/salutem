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
        return self.Surname + self.Name + self.Patronymic


class Specialists(models.Model):
    name = models.CharField(max_length=100)
    patronymic = models.CharField(max_length=100)
    surname = models.CharField(max_length=100)
    photo = models.CharField(max_length=50, blank=True)
    email = models.CharField(max_length=50, blank=True)
    phone = models.CharField(max_length=100)
    sex = models.CharField(max_length=20, choices=(('Женский', 'Женский'), ('Мужской', 'Мужской')))
    education = models.CharField(max_length=150)
    passport_num = models.CharField(max_length=20)
    inn = models.CharField(max_length=50)
    date_of_birth = models.DateField(blank=True)
    specialization = models.OneToOneField("Specializations", on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.surname + self.name + self.patronymic


class Analyzes(models.Model):
    type = models.OneToOneField("AnalyzesType", on_delete=models.CASCADE)
    specialist = models.OneToOneField("Specialists", on_delete=models.CASCADE)
    patient = models.OneToOneField("Patients", on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=20,
                              choices=(('Новый', 'Новый'), ('Ожидание', 'Ожидание'), ('Выполнен', 'Выполнен')))

    def __str__(self):
        return self.type.title + "(" + self.patient.Surname + self.patient.Name + self.patient.Patronymic + ")"


class Specializations(models.Model):
    title = models.CharField(max_length=30)

    def __str__(self):
        return self.title


class AnalyzesType(models.Model):
    title = models.CharField(max_length=240)

    def __str__(self):
        return self.title


class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    class Meta:
        permissions = (
            ('edit_tables', 'Может редактировать таблицы'),
            ('add_lesson', 'Может добавлять занятие'),
            ('add_workout', 'Может добавлять отработку/отмену'),
            ('view_schedule', 'Может просматривать расписание')
        )
