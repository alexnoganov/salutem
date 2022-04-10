from django.db import models
from django.utils import timezone

from user.models import Specialists


class Patients(models.Model):
    Sex = models.CharField(max_length=20, choices=(('Женщина', 'Женщина'), ('Мужчина', 'Мужчина')), blank=True)
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
    data_joined = models.DateField(auto_created=True, blank=True, editable=False)
    photo = models.ImageField(blank=True, upload_to='photos/patient/%m/%d/', max_length=210, null=True,
                              default='photos/unnamed.jpg')

    # Medical_card = models.OneToOneField(on_delete=models.CASCADE)

    def __str__(self):
        return self.Surname + " " + self.Name + " " + self.Patronymic


class AnalyzesType(models.Model):
    title = models.CharField(max_length=240)

    def __str__(self):
        return self.title


class Analyzes(models.Model):
    type = models.ForeignKey(AnalyzesType, on_delete=models.CASCADE)
    specialist = models.ForeignKey(Specialists, on_delete=models.CASCADE)
    patient = models.ForeignKey(Patients, on_delete=models.CASCADE)
    date = models.DateTimeField(blank=True)
    date_of_change = models.DateTimeField(auto_now=True, editable=True)
    result = models.TextField(null=True)
    status = models.CharField(max_length=20,
                              choices=(('Новый', 'Новый'), ('В процессе', 'В процессе'), ('Выполнен', 'Выполнен')),
                              default='Новый')
    show = models.BooleanField(default=True)

    def __str__(self):
        return str(
            self.pk) + ":" + self.type.title + "(" + self.patient.Surname + self.patient.Name + self.patient.Patronymic + ")"
