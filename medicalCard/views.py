from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import ListView, DetailView

from medicalCard.models import MedicalCard
from patients.models import Analyzes


class EditingPatient(ListView):
    template_name = 'medicalCard/medicalCard.html'
    model = MedicalCard

    context_object_name = 'AllMC'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        if self.request.GET.get('medicalsearchANLZ'):
            searchANLZ = self.request.GET.get('medicalsearchANLZ')
            context['analyzes'] = Analyzes.objects.filter(Q(patient_id=self.kwargs['pk']) & Q(
                test_date__istartswith=searchANLZ)).order_by('-test_date')
        else:
            context['analyzes'] = Analyzes.objects.filter(patient_id=self.kwargs['pk']).order_by('-test_date')
        if self.request.GET.get('medicalsearch'):
            searchMD = self.request.GET.get('medicalsearch')
            context['medicalCard'] = MedicalCard.objects.filter(Q(patient_id=self.kwargs['pk']) & Q(
                date=searchMD)).order_by('-date')
        else:
            context['medicalCard'] = MedicalCard.objects.filter(Q(patient_id=self.kwargs['pk'])).order_by('-date')

        # if self.request.GET.get('medicalsearchANLZ'):
        #     search = self.request.GET.get('medicalsearchANLZ')
        #     context['analyzes'] = Analyzes.objects.filter(Q(patient_id=self.kwargs['pk']) & Q(
        #         test_date__istartswith=search)).order_by('-test_date')
        #     if self.request.GET.get('medicalsearch'):
        #         pass
        # elif self.request.GET.get('medicalsearch'):
        #     search = self.request.GET.get('medicalsearch')
        #     context['medicalCard'] = MedicalCard.objects.filter(Q(patient_id=self.kwargs['pk']) & Q(
        #         date=search)).order_by('-date')
        # else:
        #     context['medicalCard'] = MedicalCard.objects.filter(Q(patient_id=self.kwargs['pk'])).order_by('-date')
        #     context['analyzes'] = Analyzes.objects.filter(patient_id=self.kwargs['pk']).order_by('-test_date')

        return context

