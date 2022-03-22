from django.contrib.auth.decorators import login_required
from django.urls import path, include

from . import views

urlpatterns = [
    path('', login_required(views.TimeTableView.as_view()), name='timetable'),
    path('analyzes/', login_required(views.TimeTableAnalyzesView.as_view()), name='timetable_analyzes'),
    path('<int:pk>/', login_required(views.TimeTableView.as_view()), name='timetable'),
    path('delete_appointment/', views.delete_appointment),
]
