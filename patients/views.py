from django.shortcuts import render
from django.views.generic import TemplateView, ListView

from patients.models import Patients


class PatientsView(ListView):
    template_name = 'patients/patients.html'
    model = Patients
    context_object_name = 'patients'
    paginate_by = 30

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        print()
        return context
