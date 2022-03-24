from django import forms

from patients.models import AnalyzesType, Patients, Analyzes
from user.models import Specialists


class PatientForm(forms.Form):
    Sex = forms.ChoiceField(choices=(('Женщина', 'Женщина'), ('Мужчина', 'Мужчина')), label="ПОЛ", required=False)
    Name = forms.CharField(max_length=100, label="* ИМЯ", required=False)
    Surname = forms.CharField(max_length=100, label="* ФАМИЛИЯ", required=False)
    Patronymic = forms.CharField(max_length=100, label="* ОТЧЕСТВО", required=False)
    Date_of_birth = forms.DateField(label="* ДАТА РОЖДЕНИЯ", required=False)
    Place_of_residence = forms.CharField(max_length=100, label="* МЕСТО ПРОЖИВАНИЯ", required=False)
    Blood_type = forms.ChoiceField(choices=(('I+', 'I+'), ('II+', 'II+'), ('III+', 'III+'),
                                            ('IV+', 'IV+'), ('I-', 'I-'), ('II-', 'II-'), ('III-',
                                                                                           'III-'),
                                            ('IV-', 'IV-')), label="ГРУППА КРОВИ", required=False)
    Telephone = forms.CharField(max_length=100, label="* НОМЕР ТЕЛЕФОНА", required=False)
    Email = forms.CharField(max_length=30, label="* E-MAIL", required=False)
    photo = forms.ImageField(required=False, max_length=200)


class PatientAddForm(PatientForm):
    Sex = forms.ChoiceField(choices=(('', '--------'), ('Женщина', 'Женщина'), ('Мужчина', 'Мужчина')), label="ПОЛ",
                            required=False)
    Blood_type = forms.ChoiceField(choices=(('', '--------'), ('I+', 'I+'), ('II+', 'II+'), ('III+', 'III+'),
                                            ('IV+', 'IV+'), ('I-', 'I-'), ('II-', 'II-'), ('III-',
                                                                                           'III-'),
                                            ('IV-', 'IV-')), label="ГРУППА КРОВИ", required=False)

class AppointmentForm(forms.Form):
    specialists = forms.ModelChoiceField(queryset=Specialists.objects.all(), empty_label=None)
    date = forms.DateTimeField()
