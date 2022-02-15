from django.urls import path

from . import views

urlpatterns = [
    path('', views.PatientsView.as_view(), name='patients'),
    path('gl/', views.EditingPatient.as_view(),),
]
