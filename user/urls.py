import django.contrib.auth.views
from django.contrib.auth.decorators import login_required

from django.urls import path

from . import views

urlpatterns = [
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
    path('add/', login_required(views.SpecialistAdd.as_view()), name='specialist_add'),
    path('add/specialist/', views.specialist_add),
    path('save_profile/', views.save_user_profile, name='save_specialist_profile'),
    path('hide_notification/', views.hide_notification, name='hide_notification'),
    path('<int:pk>/', login_required(views.SpecialistProfile.as_view()), name='specialist_profile')
]
