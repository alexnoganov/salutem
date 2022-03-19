import json

from datetime import datetime

from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import JsonResponse
from django.views.generic import ListView, DetailView

from timetable.models import TimeTable
from .models import AnalyzesType, Analyzes
from .forms import PatientForm, AppointmentForm
from patients.models import Patients


def get_appointment(request):
    if request.method == 'POST':
        if request.POST.get('date'):
            TimeTable.objects.create(specialist_id=request.POST.get('specialistId'), date=request.POST.get('date'),
                                     patient_id=request.POST.get('patientId'))
            return JsonResponse({'success': 'success'}, safe=False)
        else:
            return JsonResponse({'errors': 'error'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def get_analysis(request):
    if request.method == 'POST':
        if request.POST.get('type') == 'status':
            data = json.loads(request.POST.get('data'))
            if data:
                analysis = Analyzes.objects.get(pk=data['pk'])
                analysis.status = data['status']
                analysis.result = data['result']
                if data['status'] == 'Завершен':
                    analysis.show = False
                analysis.save()
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
        elif request.POST.get('type') == 'delete':
            data = json.loads(request.POST.get('data'))
            if data:
                Analyzes.objects.get(pk=data['pk']).delete()
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
            sex = request.POST.get('Sex')
            pk = request.POST.get('pk')
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
                JsonResponse({'success': 'success'}, safe=False)
            else:
                return JsonResponse({'errors': form.errors}, safe=False)
        else:
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
            except KeyError:
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
        context['form'] = PatientForm(initial={'Sex': self.get_object().Sex,
                                               'Blood_type': self.get_object().Blood_type})
        context['appointment_form'] = AppointmentForm(initial={'specialists': self.request.user.pk})
        context['analyzes'] = AnalyzesType.objects.all().order_by("title")
        if self.request.user.has_perm('user.edit_analyzes'):
            context['patient_analyzes'] = list(
                Analyzes.objects.filter(patient_id=self.kwargs['pk'],
                                        status__in=('Новый', 'В процессе')).values('id',
                                                                                   'status',
                                                                                   'type__title'))
        return context


class PatientsView(ListView):
    template_name = 'patients/patients.html'
    model = Patients
    context_object_name = 'patients'
    paginate_by = 30

    def get_queryset(self):
        if self.request.user.has_perm('user.edit_analyzes'):
            if self.request.GET.get('q'):
                search = self.request.GET.get('q')
                tmp = Analyzes.objects.filter(
                    Q(patient__Name__icontains=search) | Q(patient__Surname__icontains=search) | Q(
                        patient__Patronymic__icontains=search) | Q(patient__Telephone__icontains=search) | Q(
                        patient__Place_of_residence__icontains=search)).values('id', 'patient').order_by('-test_date')
                patient_range = set()
                pk_range = set()
                for k in tmp:
                    patient_range.add(k['patient'])
                patient_range = list(patient_range)
                for k in tmp:
                    for v in patient_range:
                        if k['patient'] == v:
                            pk_range.add(k['id'])
                            patient_range.remove(v)
                return Analyzes.objects.filter(Q(pk__in=pk_range) &
                                               Q(patient__Name__icontains=search) | Q(
                    patient__Surname__icontains=search) | Q(
                    patient__Patronymic__icontains=search) | Q(patient__Telephone__icontains=search) | Q(
                    patient__Place_of_residence__icontains=search)).order_by('-test_date')
            else:
                tmp = Analyzes.objects.values('id', 'patient')
                patient_range = set()
                pk_range = set()
                for k in tmp:
                    patient_range.add(k['patient'])
                patient_range = list(patient_range)
                for k in tmp:
                    for v in patient_range:
                        if k['patient'] == v:
                            pk_range.add(k['id'])
                            patient_range.remove(v)
                return Analyzes.objects.filter(pk__in=pk_range).order_by('-test_date')
        else:
            if self.request.GET.get('q'):
                search = self.request.GET.get('q')
                return Patients.objects.filter(
                    Q(Name__icontains=search) | Q(Surname__icontains=search) | Q(
                        Patronymic__icontains=search) | Q(Telephone__icontains=search) | Q(
                        Place_of_residence__icontains=search)).order_by('-data_joined')
            else:
                return Patients.objects.all().order_by('-data_joined')
