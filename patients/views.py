import itertools
import json

from datetime import datetime
from itertools import groupby

from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import JsonResponse
from django.views.generic import ListView, DetailView

from .models import AnalyzesType, Analyzes
from .forms import PatientForm
from patients.models import Patients


def get_analysis(request):
    if request.method == 'POST':
        if request.POST.get('type') == 'status':
            data = json.loads(request.POST.get('data'))
            if data:
                print(data)
                Analyzes.objects.filter(pk=data['pk']).update(result=data['result'], status=data['status'])
                return JsonResponse({'success': 'success'}, safe=False)
            else:
                return JsonResponse({'errors': 'error'}, safe=False)
        elif request.POST.get('type') == 'register':
            data = json.loads(request.POST.get('data'))
            if data:
                Analyzes.objects.create(type_id=data['type'], test_date=data['date'],
                                        specialist_id=data['specialistId'],
                                        patient_id=data['patientId'])
                return JsonResponse({'success': 'success'}, safe=False)
            else:
                return JsonResponse({'errors': 'error'}, safe=False)
        else:
            return JsonResponse({'errors': 'error'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def profile_user(request):
    if request.method == 'POST':
        if request.POST.get("Sex"):
            Sex = request.POST.get('Sex')
            pk = request.POST.get('pk')
            Username = request.POST.get('username')
            Surname = request.POST.get('surname')
            Patronymic = request.POST.get('Patronymic')
            Date_of_birth = request.POST.get('Date_of_birth')
            Phone = request.POST.get('phone')
            Email = request.POST.get('email')
            Place_of_residence = request.POST.get('Place_of_residence')
            Blood_type = request.POST.get('Blood_type')

            form = PatientForm(request.POST)

            if form.is_valid():
                Patients.objects.filter(id=pk).update(Sex=Sex, Name=Username, Surname=Surname, Patronymic=Patronymic,
                                                      Date_of_birth=Date_of_birth, Telephone=Phone, Email=Email,
                                                      Place_of_residence=Place_of_residence, Blood_type=Blood_type)
            else:
                return JsonResponse({'errors': form.errors}, safe=False)
        else:
            try:
                photo = request.FILES['photo']
                pk = photo.name.split("!", 1)[0]
                photo.name = photo.name.split("!", 1)[1]
                FileStorage = FileSystemStorage(location=settings.MEDIA_ROOT + "/photos/patient/" + datetime.now(
                ).strftime("%m/%d"))
                FileStorage.save(photo.name, photo)

                PhotoProfile = Patients.objects.get(id=pk)

                PhotoProfile.photo = "photos/patient/" + datetime.now().strftime("%m/%d") + "/" + photo.name
                PhotoProfile.save()
            except:
                photo = request.POST
                photo = list(photo.keys())
                photo = ''.join(photo)
                pk = photo.split("!", 1)[0]
                photo = photo.split("!", 1)[1]
                Patients.objects.filter(id=pk).update(photo=photo)

        return JsonResponse({'success': 'success'}, safe=False)

    else:
        form = PatientForm()
    return JsonResponse({'errors': form.errors}, safe=False)


class EditingPatient(DetailView):
    template_name = 'patients/ActPatient.html'
    model = Patients
    context_object_name = 'profile'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = PatientForm()
        context['analyzes'] = AnalyzesType.objects.all().order_by("title")
        if self.request.user.has_perm('user.edit_analyzes'):
            context['patient_analyzes'] = list(
                Analyzes.objects.filter(patient_id=self.kwargs['pk']).values('id', 'status', 'type__title'))
        return context


class PatientsView(ListView):
    template_name = 'patients/patients.html'
    model = Patients
    context_object_name = 'patients'
    paginate_by = 30

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        tmp = list(Analyzes.objects.values('id', 'patient'))
        # v_by_k = dict()
        # for d in tmp:
        #     for k, v in d.items():
        #         if v not in v_by_k:
        #             v_by_k[v] = k
        # new_d = {v: k for k, v in v_by_k.items()}
        # print(new_d)
        return context

    def get_queryset(self):
        if self.request.user.has_perm('user.edit_analyzes'):
            if self.request.GET.get('q'):
                search = self.request.GET.get('q')
                return Analyzes.objects.filter(
                    Q(patient__Name__icontains=search) | Q(patient__Surname__icontains=search) | Q(
                        patient__Patronymic__icontains=search) | Q(patient__Telephone__icontains=search) | Q(
                        patient__Place_of_residence__icontains=search)).order_by('-test_date')
            else:
                return Analyzes.objects.all().order_by('-test_date')
                # return Analyzes.objects.all().order_by('-test_date')
        else:
            if self.request.GET.get('q'):
                search = self.request.GET.get('q')
                return Patients.objects.filter(
                    Q(Name__icontains=search) | Q(Surname__icontains=search) | Q(
                        Patronymic__icontains=search) | Q(Telephone__icontains=search) | Q(
                        Place_of_residence__icontains=search)).order_by('-data_joined')
            else:
                return Patients.objects.all().order_by('-data_joined')
