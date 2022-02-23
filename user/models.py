from django.contrib import admin
from django.db import models
from django.contrib.auth.models import User, AbstractUser, Group, Permission
from django.db.models import Value
from django.db.models.functions import Concat
from django.utils.translation import gettext_lazy as _

from user.managers import SpecialistManager


class Specialists(AbstractUser):
    patronymic = models.CharField(max_length=100, verbose_name="Отчество", blank=True)
    photo = models.ImageField(blank=True, upload_to='photos/specialists/', max_length=210)
    phone = models.CharField(max_length=100, verbose_name='Номер телефона', blank=True)
    sex = models.CharField(max_length=20, choices=(('Женский', 'Женский'), ('Мужской', 'Мужской')), verbose_name='Пол',
                           blank=True)
    education = models.TextField(max_length=150, verbose_name='Образование', blank=True)
    passport_num = models.CharField(max_length=20, verbose_name='Серия и номер паспорта', blank=True)
    inn = models.CharField(max_length=50, verbose_name='ИНН', blank=True)
    date_of_birth = models.DateField(blank=True, null=True, verbose_name='Дата рождения')
    specialization = models.OneToOneField("Specializations", on_delete=models.SET_NULL, null=True, blank=True)

    REQUIRED_FIELDS = ["email"]

    objects = SpecialistManager()

    class Meta:
        permissions = (
            ('edit_analyzes', 'Может редактировать анализы'),
        )
        verbose_name_plural = 'Специалисты'
        verbose_name = 'Специалист'

    def __str__(self):
        return self.last_name + ' ' + self.first_name + ' ' + self.patronymic

    @admin.display(ordering=Concat('last_name', Value(' '), 'first_name', Value(' '), 'patronymic'), description='ФИО')
    def full_name(self):
        return self.last_name + ' ' + self.first_name + ' ' + self.patronymic


class Specializations(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title


class SpecialistGroup(Group):
    class Meta:
        verbose_name = _('Группа')
        verbose_name_plural = _('Группы')