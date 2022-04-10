from django.db.models import Q
from django.shortcuts import render
from django.views.generic import ListView, DetailView

from patients.models import Patients
from sicklist.models import sickList
from user.models import Specialists


class sickListPatient(ListView):
    template_name = 'sicklist/sicklist.html'
    model = sickList
    context_object_name = 'sickListAll'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        context['patient'] = Patients.objects.get(id=self.kwargs['pk'])
        context['specialist'] = Specialists.objects.filter(id=self.kwargs['pk'])
        return context
