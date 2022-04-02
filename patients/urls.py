from django.contrib.auth.decorators import login_required
from django.urls import path, include

from . import views

urlpatterns = [
    path('', login_required(views.PatientsView.as_view()), name='patients'),
    path('profile/<int:pk>/', login_required(views.EditingPatient.as_view()), name='profile'),
    path('profile/<int:pk>/medicalcard/', include('medicalCard.urls')),
    path('profile/<int:pk>/sicklist/', include('sicklist.urls')),
    path('add/', login_required(views.PatientAddView.as_view()), name='add_patient'),
    path('add/patient', views.add_patient),
    path('save_profile/', views.profile_user, name="save_profile"),
    path('save_profile_photo/', views.profile_user_photo, name="save_profile_photo"),
    path('analysis/', views.get_analysis, name="analysis"),
    path('appointment/', views.get_appointment, name="appointment"),
]
