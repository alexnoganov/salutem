from django.db.models import Q
from django.http import JsonResponse
from django.views.generic import ListView, DetailView
from .forms import PatientForm
from patients.models import Patients


def profile_user(request):
    if request.method == 'POST':
        pk = request.POST.get('pk')
        Sex = request.POST.get('Sex')
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
