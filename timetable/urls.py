from django.contrib.auth.decorators import login_required
from django.urls import path, include

from . import views

urlpatterns = [
    path('', login_required(views.TimeTableView.as_view()), name='timetable'),
    path('<int:pk>/', login_required(views.TimeTableView.as_view()), name='timetable'),
    path('delete_appointment/', views.delete_appointment),
]
