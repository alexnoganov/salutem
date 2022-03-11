from django import forms
from django.contrib.auth import get_user_model
from django.db.models import Q
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import Specialists

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
