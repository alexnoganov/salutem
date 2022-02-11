import django.contrib.auth.views

from django.urls import path

from . import views

urlpatterns = [
    path('login/', views.user_login, name='login'),
    path('logout/', django.contrib.auth.views.LogoutView.as_view(), name='logout'),
]
