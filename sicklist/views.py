import json
from django.db.models import Q
from django.http import JsonResponse
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


def addSickList(request, pk):
    if request.method == 'POST':
        try:
            data = json.loads(request.POST.get('data'))
            print(data)
            pass
        except KeyError:
            pass
        return JsonResponse({'success': 'success'}, safe=False)
    return JsonResponse({'errors': 'errors'}, safe=False)
