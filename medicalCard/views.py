from django.shortcuts import render
from django.views.generic import DetailView

from medicalCard.models import MedicalCard
from patients.models import Analyzes


class EditingPatient(DetailView):
    template_name = 'medicalCard/medicalCard.html'

    model = MedicalCard
    context_object_name = 'medicalCard'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['analyzes'] = Analyzes.objects.filter(patient_id=self.kwargs['pk'])
        # if self.request.user.has_perm('user.edit_analyzes'):
        #     context['patient_analyzes'] = list(
        #         Analyzes.objects.filter(patient_id=self.kwargs['pk'],
        #                                 status__in=('Новый', 'В процессе')).values('id',
        #                                                                            'status',
        #                                                                            'type__title'))
        return context
