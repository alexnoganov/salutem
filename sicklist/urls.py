from django.contrib.auth.decorators import login_required
from django.urls import path

from . import views
# from .views import params_test

urlpatterns = [
    path('', login_required(views.sickListPatient.as_view()), name="sickList"),
]