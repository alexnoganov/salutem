from django.db import models

from patients.models import Patients
from user.models import Specialists


class TimeTable(models.Model):
    specialist = models.ForeignKey(Specialists, on_delete=models.CASCADE)
    patient = models.ForeignKey(Patients, on_delete=models.CASCADE)
    date = models.DateTimeField(verbose_name='Дата приема')
