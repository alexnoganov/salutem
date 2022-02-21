import os
from datetime import date, datetime

from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import JsonResponse
from django.views.generic import ListView, DetailView

from .models import AnalyzesType
from .forms import PatientForm
from patients.models import Patients


def get_analysis(request):
    if request.method == 'POST':
        analysis_type = request.POST.get('analysisType')
        analysis_date = request.POST.get('date')
        specialist_id = request.POST.get('specialistId')
        patient_id = request.POST.get('patientId')
        return JsonResponse({'success': 'success'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def profile_user(request):
    if request.method == 'POST':
        pk = request.POST.get('pk')
        sex = request.POST.get('Sex')
        username = request.POST.get('username')
        surname = request.POST.get('surname')
        patronymic = request.POST.get('Patronymic')
        date_of_birth = request.POST.get('Date_of_birth')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        place_of_residence = request.POST.get('Place_of_residence')
        blood_type = request.POST.get('Blood_type')

        form = PatientForm(request.POST)

        if form.is_valid():
            Patients.objects.filter(id=pk).update(Sex=sex, Name=username, Surname=surname, Patronymic=patronymic,
                                                  Date_of_birth=date_of_birth, Telephone=phone, Email=email,
                                                  Place_of_residence=place_of_residence, Blood_type=blood_type)
        try:
            photo = request.FILES['photo']
            pk = photo.name.split("!", 1)[0]
            photo.name = photo.name.split("!", 1)[1]

            file_storage = FileSystemStorage(location=settings.MEDIA_ROOT + "/photos/patient/" + datetime.now(
            ).strftime("%m/%d"))
            file_storage.save(photo.name, photo)

            photo_profile = Patients.objects.get(id=pk)

            photo_profile.photo = "photos/patient/" + datetime.now().strftime("%m/%d") + "/" + photo.name
            photo_profile.save()
        except:
            pass

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
