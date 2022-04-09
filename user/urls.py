import django.contrib.auth.views
from django.contrib import auth
from django.contrib.auth.decorators import login_required

from django.urls import path, reverse_lazy

from . import views

urlpatterns = [
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
    path('add/', login_required(views.SpecialistAdd.as_view()), name='specialist_add'),
    path('add/specialist/', views.specialist_add),
    path('save_profile/', views.save_user_profile, name='save_specialist_profile'),
    path('change_password/', views.change_password, name='change_password'),
    path('reset_password/', views.reset_password),
    path('reset_password/<uidb64>/<token>/',
         auth.views.PasswordResetConfirmView.as_view(template_name='user/password/password_reset.html',
                                                     success_url=reverse_lazy('login')), name='reset_password'),
    path('<int:pk>/', login_required(views.SpecialistProfile.as_view()), name='specialist_profile'),
    path('activity/', views.get_activity),
]
