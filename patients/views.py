from django.db.models import Q
from django.shortcuts import render
from django.views.generic import TemplateView, ListView

from patients.models import Patients


class EditingPatient(ListView):
    template_name = 'patients/ActPatient.html'
    model = Patients


class PatientsView(ListView):
    template_name = 'patients/patients.html'
    model = Patients
    context_object_name = 'patients'
    paginate_by = 30

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_queryset(self):
        if self.request.GET.get('q'):
            search = self.request.GET.get('q')
            return Patients.objects.filter(
                Q(Name__icontains=search) | Q(Surname__icontains=search) | Q(
                    Patronymic__icontains=search) | Q(Telephone__icontains=search) | Q(
                    Place_of_residence__icontains=search))
        else:
            return Patients.objects.all()
