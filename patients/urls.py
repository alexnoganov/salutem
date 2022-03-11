from django.contrib.auth.decorators import login_required
from django.urls import path

from . import views

urlpatterns = [
    path('', login_required(views.PatientsView.as_view()), name='patients'),
    path('profile/<int:pk>/', login_required(views.EditingPatient.as_view()), name='profile'),
    path('save_profile/', views.profile_user, name="save_profile"),
    path('analysis/', views.get_analysis, name="analysis"),
]
