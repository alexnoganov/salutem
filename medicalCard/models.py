from django.db import models
from patients.models import Patients


class MedicalCard(models.Model):
    patient = models.ForeignKey(Patients, on_delete=models.CASCADE)
    purpose = models.CharField(max_length=300)
    symptoms = models.CharField(max_length=300)
    treatment = models.CharField(max_length=500)
    date = models.DateField(auto_now=True)

    def __str__(self):
        return self.patient.Name + self.patient.Surname

