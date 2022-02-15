from django.shortcuts import render
from django.views.generic import TemplateView


class PatientsView(TemplateView):
    template_name = 'patients/patients.html'
