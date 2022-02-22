import os
from datetime import date, datetime

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
        analysis_type = request.POST.get('analysisType')
        analysis_date = request.POST.get('analysisDate')
        specialist_id = request.POST.get('specialistId')
        patient_id = request.POST.get('patientId')
        if analysis_type and analysis_date and specialist_id and patient_id:
            Analyzes.objects.create(type_id=analysis_type, test_date=analysis_date, specialist_id=specialist_id,
                                    patient_id=patient_id)
            return JsonResponse({'success': 'success'}, safe=False)
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
        return context


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
