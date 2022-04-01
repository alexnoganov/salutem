import json
from datetime import datetime

from django import template
from django.contrib import messages
from django.contrib.auth.hashers import check_password
from django.conf import settings
from django.contrib.auth import logout, authenticate, login
from django.contrib.auth.password_validation import validate_password
from django.contrib.auth.tokens import default_token_generator
from django.core.exceptions import ValidationError, ObjectDoesNotExist
from django.core.files.storage import FileSystemStorage
from django.core.mail import send_mail, BadHeaderError, EmailMultiAlternatives
from django.db.models import Q
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.views.generic import DetailView, ListView, TemplateView
from django.utils.translation import gettext as _

from patients.models import Analyzes
from .forms import LoginForm, SpecialistForm, SpecialistAddForm, SpecialistResetPasswordForm
from .models import Specialists, SpecialistGroup


def user_login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            user = authenticate(username=cd['username'], password=cd['password'])
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('home')
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
                    if data['date_of_birth'] == '':
                        data['date_of_birth'] = None
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
                pk = photo.name.split("!", 1)[0]
                photo.name = photo.name.split("!", 1)[1]
                file_storage = FileSystemStorage(location=settings.MEDIA_ROOT + "/photos/specialists/" + datetime.now(
                ).strftime("%m/%d"))
                file_storage.save(photo.name, photo)
                Specialists.objects.filter(id=pk).update(photo="photos/specialists/" + datetime.now().strftime("%m/%d") + "/" + photo.name)

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


class SpecialistListView(ListView):
    model = Specialists
    context_object_name = 'specialists'
    template_name = 'user/specialists.html'
    paginate_by = 30

    def get(self, request, *args, **kwargs):
        self.object_list = self.get_queryset()
        allow_empty = self.get_allow_empty()
        context = self.get_context_data()

        if not allow_empty:
            if self.get_paginate_by(self.object_list) is not None and hasattr(self.object_list, 'exists'):
                is_empty = not self.object_list.exists()
            else:
                is_empty = not self.object_list
            if is_empty:
                raise Http404(_('Empty list and “%(class_name)s.allow_empty” is False.') % {
                    'class_name': self.__class__.__name__,
                })
        if self.request.user.is_staff:
            return self.render_to_response(context)
        else:
            return HttpResponseRedirect(reverse_lazy('home'))

    def get_queryset(self):
        if self.request.GET.get('q'):
            search = self.request.GET.get('q')
            return Specialists.objects.filter(
                Q(first_name__icontains=search) | Q(last_name__icontains=search) | Q(
                    patronymic__icontains=search) | Q(phone__icontains=search) | Q(
                    email__icontains=search)).order_by('-last_login')
        else:
            return Specialists.objects.all().order_by('-last_login')


class SpecialistProfile(DetailView):
    model = Specialists
    template_name = 'user/profile.html'
    context_object_name = 'profile'

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        context = self.get_context_data(object=self.object)
        if kwargs.get('pk') == self.request.user.pk:
            return self.render_to_response(context)
        else:
            if self.request.user.is_staff:
                return self.render_to_response(context)
            else:
                return HttpResponseRedirect(reverse_lazy('specialist_profile', kwargs={'pk': self.request.user.pk}))

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = SpecialistForm(initial={'specializations': self.get_object().specialization_id,
                                                  'sex': self.get_object().sex})
        context['reset_form'] = SpecialistResetPasswordForm
        return context


class SpecialistAdd(TemplateView):
    template_name = 'user/specialist_add.html'

    def get_context_data(self, **kwargs):
        context = super(SpecialistAdd, self).get_context_data()
        context['form'] = SpecialistAddForm
        return context


def specialist_add(request):
    if request.method == 'POST':
        if request.POST.get('data'):
            form = SpecialistAddForm(json.loads(request.POST.get('data')))
            if form.is_valid():
                data = json.loads(request.POST.get('data'))
                if data['date_of_birth'] == '':
                    data['date_of_birth'] = None
                specialist = Specialists.objects.create_user(sex=data['sex'],
                                                             first_name=data['first_name'],
                                                             last_name=data['last_name'],
                                                             patronymic=data['patronymic'],
                                                             date_of_birth=data['date_of_birth'],
                                                             phone=data['phone'], email=data['email'],
                                                             place_of_residence=data['place_of_residence'],
                                                             passport_num=data['passport_num'], inn=data['inn'],
                                                             specialization_id=data['spec'],
                                                             education=data['education'],
                                                             username=data['username'])
                if data['group']:
                    group = SpecialistGroup.objects.get(name='Лаборатория')
                    specialist.groups.add(group)
                return JsonResponse({'success': 'success'}, safe=False)
            else:
                return JsonResponse({'errors': form.errors}, safe=False)

        else:
            return JsonResponse({'errors': 'error'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def redirect_to_profile(request):
    print(request.user.is_staff)
    if request.user.is_staff:
        return HttpResponseRedirect(reverse_lazy('specialists'))
    else:
        return HttpResponseRedirect(reverse_lazy('patients'))


def change_password(request):
    if request.method == 'POST':
        if request.POST.get('current_password'):
            form = SpecialistResetPasswordForm(request.POST)
            if form.is_valid():
                current_password = request.POST.get('current_password')
                new_password = request.POST.get('new_password')
                confirm_new_password = request.POST.get('confirm_new_password')
                if check_password(current_password, request.user.password):
                    if current_password == new_password:
                        return JsonResponse({'errors': 'passwords_match'}, safe=False)
                    else:
                        try:
                            validate_password(new_password)
                            user = Specialists.objects.get(username=request.user.username)
                            user.set_password(new_password)
                            user.save()
                            login(request, user)
                            return JsonResponse({'success': 'success'}, safe=False)
                        except ValidationError as e:
                            return JsonResponse({'errors': {'validation': e.messages}}, safe=False)
                else:
                    return JsonResponse({'errors': 'does_not_match'}, safe=False)
            else:
                return JsonResponse({'errors': form.errors}, safe=False)
        else:
            return JsonResponse({'errors': 'error'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def reset_password(request):
    if request.method == 'POST':
        if request.POST.get('username'):
            try:
                user = Specialists.objects.get(username=request.POST.get('username'))
                subject = "Восстановление пароля на Salutem"
                html_template = template.loader.get_template('user/password/password_reset_email.html')
                text_template = template.loader.get_template('user/password/password_reset_email.txt')
                c = {
                    "email": user.email,
                    'domain': '127.0.0.1:8000',
                    'site_name': 'Salutem',
                    "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                    "user": user,
                    'token': default_token_generator.make_token(user),
                    'protocol': 'http',
                }
                text_content = text_template.render(c)
                html_content = html_template.render(c)
                try:
                    msg = EmailMultiAlternatives(subject, text_content, 'Salutem <admin@salutem.com>', [user.email],
                                                 headers={'Reply-To': 'admin@salutem.com'})
                    msg.attach_alternative(html_content, "text/html")
                    msg.send()
                except BadHeaderError:
                    return JsonResponse({'errors': 'error'}, safe=False)
                return JsonResponse({'success': {'email': email_mask(user.email)}}, safe=False)
            except ObjectDoesNotExist:
                return JsonResponse({'errors': 'not_exist'}, safe=False)
        else:
            return JsonResponse({'errors': 'error'}, safe=False)
    else:
        return JsonResponse({'errors': 'error'}, safe=False)


def email_mask(email):
    lo = email.find('@')
    if lo > 0:
        return email[0:2] + "####" + email[lo - 2:]
