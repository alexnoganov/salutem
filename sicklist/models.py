from django.db import models
from patients.models import Patients


class sickList(models.Model):
    dateIssue = models.DateTimeField(auto_now=True)

