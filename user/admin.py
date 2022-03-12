from django.contrib import admin
from django.contrib.auth.admin import UserAdmin, GroupAdmin
from django.contrib.auth.models import User, Group

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import Specialists, SpecialistGroup

admin.site.unregister(Group)


#
#
@admin.register(SpecialistGroup)
class GroupAdmin(admin.ModelAdmin):
    search_fields = ('name',)
    ordering = ('name',)
    filter_horizontal = ('permissions',)

    def formfield_for_manytomany(self, db_field, request=None, **kwargs):
        if db_field.name == 'permissions':
            qs = kwargs.get('queryset', db_field.remote_field.model.objects)
            kwargs['queryset'] = qs.select_related('content_type')
        return super().formfield_for_manytomany(db_field, request=request, **kwargs)


@admin.register(Specialists)
class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = Specialists
    list_display = ('email', 'full_name', 'is_staff', 'is_active',)
    list_filter = ('username', 'is_staff', 'is_active',)
    fieldsets = (
        ('Данные для авторизации', {'fields': ('username', 'password')}),
        ('Личные данные',
         {'fields': (
             'last_name', 'first_name', 'patronymic', 'sex', 'date_of_birth', 'place_of_residence', 'inn',
             'passport_num', 'education',
             'specialization', 'phone', 'email', 'photo')}),
        ('Права доступа', {'fields': ('groups', 'is_staff', 'is_active', 'last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'password1', 'password2', 'is_staff', 'is_active')}
         ),
    )
    readonly_fields = ['date_joined', 'last_login']
    search_fields = ('email', 'username', 'first_name', 'last_name', 'patronymic')
    ordering = ('username',)
