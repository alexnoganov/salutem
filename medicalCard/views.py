import datetime
import json

from django.db.models import Q
from django.http import JsonResponse
from django.views.generic import ListView

from medicalCard.models import MedicalCard
from patients.models import Analyzes


def deleteMR(request):
    if request.method == 'POST':
        if request.POST.get('id'):
            MedicalCard.objects.get(id=request.POST.get("id"))
            # добавить .delete() на запрос
            return JsonResponse({'success': 'success'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def addMR(request, pk):
    if request.method == 'POST':
        destination = request.POST.get("destination")
        treatment = request.POST.get("treatment")
        symptoms = request.POST.get("symptoms")
        symptoms = json.loads(symptoms)
        symptoms = '!'.join(symptoms)
        MedicalCard.objects.create(purpose=destination, symptoms=symptoms, treatment=treatment, patient_id=pk,
                                   date=datetime.date.today())

        return JsonResponse({'success': 'success'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def updateMR(request, pk):
    if request.method == 'POST':
        destination = request.POST.get("destination")
        treatment = request.POST.get("treatment")
        recordPK = request.POST.get("recordPK")
        symptoms = request.POST.get("symptoms")
        symptoms = json.loads(symptoms)
        symptoms = '!'.join(symptoms)
        MedicalCard.objects.filter(id=recordPK).update(purpose=destination, symptoms=symptoms, treatment=treatment,
                                                       patient_id=pk,
                                                       date=datetime.datetime.now())

        return JsonResponse({'success': 'success'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


class EditingPatient(ListView):
    template_name = 'medicalCard/medicalCard.html'
    model = MedicalCard

    context_object_name = 'AllMC'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        if self.request.GET.get('medicalsearchANLZ'):
            searchANLZ = self.request.GET.get('medicalsearchANLZ')
            context['analyzes'] = Analyzes.objects.filter(Q(patient_id=self.kwargs['pk']) & Q(
                test_date__istartswith=searchANLZ)).order_by('-date')
        else:
            context['analyzes'] = Analyzes.objects.filter(patient_id=self.kwargs['pk']).order_by('-date')
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
