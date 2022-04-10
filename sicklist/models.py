from django.db import models
from patients.models import Patients
from user.models import Specialists


class sickList(models.Model):
    dateIssue = models.DateTimeField(auto_now=True)
    orgn = models.CharField(max_length=100, blank=True)
    disability_code = models.CharField(max_length=100, blank=True)
    disability_code_addit = models.CharField(max_length=100, blank=True)
    place_of_work = models.CharField(max_length=100, blank=True)
    based = models.BooleanField(default=False)
    currently = models.BooleanField(default=False)
    number_work = models.CharField(max_length=100, blank=True)
    public_organizations = models.CharField(max_length=100, blank=True)
    from_what_date = models.DateTimeField(auto_now=True)
    by_what_number = models.DateTimeField(auto_now=True)
    patient = models.ForeignKey(Patients, on_delete=models.CASCADE, null=True)
    specialist = models.ForeignKey(Specialists, on_delete=models.CASCADE, null=True)

