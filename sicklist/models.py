from django.db import models
from patients.models import Patients
from user.models import Specialists


class sickList(models.Model):
    dateIssue = models.DateTimeField(auto_now=True)
    md_organization = models.CharField(max_length=100, blank=True)
    address_of_md_organization = models.CharField(max_length=100, blank=True)
    orgn = models.CharField(max_length=100, blank=True)
    disability_code = models.CharField(max_length=100, blank=True)
    disability_code_addit = models.CharField(max_length=100)
    place_of_work = models.CharField(max_length=100)
    based = models.BooleanField(default=False)
    currently = models.BooleanField(default=False)
    number_work = models.CharField(max_length=100, blank=True)
    public_organizations = models.BooleanField(default=False)
    from_what_date = models.DateTimeField(auto_now=True)
    by_what_number = models.DateTimeField(auto_now=True)
    patient = models.ForeignKey(Patients, on_delete=models.CASCADE)
    specialist = models.ForeignKey(Specialists, on_delete=models.CASCADE)

