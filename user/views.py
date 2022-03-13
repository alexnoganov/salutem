import json
from datetime import datetime

from django.conf import settings
from django.contrib.auth import logout, authenticate, login
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import DetailView

from patients.models import Analyzes
from .forms import LoginForm, SpecialistForm
from .models import Specialists


def user_login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            user = authenticate(username=cd['username'], password=cd['password'])
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('patients')
                else:
                    return HttpResponse('Аккаунт отключен')
            else:
                return HttpResponse('Неверный логин')
    else:
        form = LoginForm()
    return render(request, 'user/login.html', {'login_form': form})


def user_logout(request):
    logout(request)
    return redirect('login')


def save_user_profile(request):
    if request.method == 'POST':
        if request.POST.get('data'):
            data = json.loads(request.POST.get('data'))
            if data:
                form = SpecialistForm(request.POST)
                if form.is_valid():
                    Specialists.objects.filter(pk=data['pk']).update(
                        sex=data['sex'],
                        first_name=data['first_name'],
                        last_name=data['last_name'],
                        patronymic=data['patronymic'],
                        phone=data['phone'],
                        date_of_birth=data['date_of_birth'],
                        place_of_residence=data['place_of_residence'],
                        education=data['education'],
                        passport_num=data['passport_num'],
                        inn=data['inn'],
                        specialization=data['spec'],
                    )
                    return JsonResponse({'success': 'success'}, safe=False)
                else:
                    return JsonResponse({'errors': form.errors}, safe=False)
        else:
            try:
                photo = request.FILES['photo']
                print(photo.name)
                pk = photo.name.split("!", 1)[0]
                photo.name = photo.name.split("!", 1)[1]
                file_storage = FileSystemStorage(location=settings.MEDIA_ROOT + "/photos/specialists/" + datetime.now(
                ).strftime("%m/%d"))
                file_storage.save(photo.name, photo)

                photo_profile = Specialists.objects.get(id=pk)

                photo_profile.photo = "photos/specialists/" + datetime.now().strftime("%m/%d") + "/" + photo.name
                photo_profile.save()
            except KeyError:
                photo = request.POST
                photo = list(photo.keys())
                photo = ''.join(photo)
                pk = photo.split("!", 1)[0]
                photo = photo.split("!", 1)[1]
                Specialists.objects.filter(id=pk).update(photo=photo)

        return JsonResponse({'success': 'success'}, safe=False)
    else:
        form = SpecialistForm()
    return JsonResponse({'errors': form.errors}, safe=False)


class SpecialistProfile(DetailView):
    model = Specialists
    template_name = 'user/profile.html'
    context_object_name = 'profile'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = SpecialistForm(initial={'specializations': self.get_object().specialization_id,
                                                  'sex': self.get_object().sex})
        return context


def redirect_to_profile(request):
    return HttpResponseRedirect(reverse_lazy('patients'))


def hide_notification(request):
    if request.POST.get('pk'):
        # Analyzes.objects.filter(pk=request.POST.get('pk')).update(show=False)
        return JsonResponse({'success': 'success'}, safe=False)
    else:
        return JsonResponse({'error': 'error'}, safe=False)
