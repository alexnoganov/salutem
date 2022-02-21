from django.db import models
from user.models import Specialists


class Patients(models.Model):
    Sex = models.CharField(max_length=20, choices=(('Женщина', 'Женщина'), ('Мужчина', 'Мужчина')))
    Name = models.CharField(max_length=100)
    Surname = models.CharField(max_length=100)
    Patronymic = models.CharField(max_length=100)
    Date_of_birth = models.DateField(blank=True)
    Place_of_residence = models.CharField(max_length=100, blank=True)
    Blood_type = models.CharField(max_length=10, choices=(('I+', 'I+'), ('II+', 'II+'), ('III+', 'III+'),
                                                          ('IV+', 'IV+'), ('I-', 'I-'), ('II-', 'II-'), ('III-',
                                                                                                         'III-'),
                                                          ('IV-', 'IV-')), blank=True)
    Telephone = models.CharField(max_length=100, blank=True)
    Email = models.CharField(max_length=30, blank=True)
    photo = models.ImageField(blank=True, upload_to='photos/patient/%m/%d/', max_length=210)

    # Medical_card = models.OneToOneField(on_delete=models.CASCADE)

    def __str__(self):
        return self.Name + self.Surname


class AnalyzesType(models.Model):
    title = models.CharField(max_length=240)

    def __str__(self):
        return self.title


class Analyzes(models.Model):
    type = models.OneToOneField(AnalyzesType, on_delete=models.CASCADE)
    specialist = models.OneToOneField(Specialists, on_delete=models.CASCADE)
    patient = models.OneToOneField(Patients, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=20,
                              choices=(('Новый', 'Новый'), ('Ожидание', 'Ожидание'), ('Выполнен', 'Выполнен')))

    def __str__(self):
        return self.type.title + "(" + self.patient.Surname + self.patient.Name + self.patient.Patronymic + ")"
