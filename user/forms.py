from django import forms
from django.contrib.auth import get_user_model
from django.db.models import Q
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import Specialists, Specializations

User = get_user_model()


class LoginForm(forms.Form):
    username = forms.CharField(label='Имя пользователя', widget=forms.TextInput(), required=False)
    password = forms.CharField(label='Пароль', widget=forms.PasswordInput(), required=False)

    def clean(self):
        username = self.cleaned_data['username']
        password = self.cleaned_data['password']
        if not User.objects.filter(Q(username=username)).exists():
            raise forms.ValidationError("Неверный логин или пароль")
        user = User.objects.filter(Q(username=username)).first()
        if user:
            if not user.check_password(password):
                raise forms.ValidationError("Неверный логин или пароль")
        return self.cleaned_data


class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = Specialists
        fields = ('email',)


class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = Specialists
        fields = ('email',)


class SpecialistForm(forms.Form):
    sex = forms.ChoiceField(choices=(('Женщина', 'Женщина'), ('Мужчина', 'Мужчина')), label="ПОЛ", required=False)
    name = forms.CharField(max_length=100, label="* ИМЯ", required=False)
    surname = forms.CharField(max_length=100, label="* ФАМИЛИЯ", required=False)
    patronymic = forms.CharField(max_length=100, label="* ОТЧЕСТВО", required=False)
    date_of_birth = forms.DateField(label="* ДАТА РОЖДЕНИЯ", required=False)
    place_of_residence = forms.CharField(max_length=100, label="* МЕСТО ПРОЖИВАНИЯ", required=False)
    telephone = forms.CharField(max_length=100, label="* НОМЕР ТЕЛЕФОНА", required=False)
    email = forms.CharField(max_length=30, label="* E-MAIL", required=False)
    photo = forms.ImageField(required=False, max_length=200)
    education = forms.CharField(widget=forms.Textarea, label='* ОБРАЗОВАНИЕ', required=False)
    passport_num = forms.CharField(max_length=20, label='* СЕРИЯ И НОМЕР ПАСПОРТА', required=False)
    inn = forms.CharField(max_length=50, label='* ИНН', required=False)
    specializations = forms.ModelChoiceField(queryset=Specializations.objects.all(), required=False)
