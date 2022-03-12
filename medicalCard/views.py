from django.shortcuts import render
from django.views.generic import DetailView

from patients.models import Patients


class EditingPatient(DetailView):
    template_name = 'medicalCard/medicalCard.html'

    model = Patients
    context_object_name = 'profile'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # context['form'] = PatientForm()
        # context['analyzes'] = AnalyzesType.objects.all().order_by("title")
        # if self.request.user.has_perm('user.edit_analyzes'):
        #     context['patient_analyzes'] = list(
        #         Analyzes.objects.filter(patient_id=self.kwargs['pk'],
        #                                 status__in=('Новый', 'В процессе')).values('id',
        #                                                                            'status',
        #                                                                            'type__title'))
        return context
