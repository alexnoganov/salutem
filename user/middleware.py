from django.contrib.auth import logout
from django.utils import timezone
from .models import Specialists


class UpdateLastActivityMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        return self.get_response(request)

    def process_view(self, request, view_func, view_args, view_kwargs):
        assert hasattr(request,
                       'user'), 'The UpdateLastActivityMiddleware requires authentication middleware to be installed.'
        if request.user.is_authenticated:
            if request.user.last_activity:
                if request.user.last_activity.date() < timezone.now().date():
                    Specialists.objects.filter(pk=request.user.id).update(last_activity=timezone.now())
                    logout(request)
                else:
                    Specialists.objects.filter(pk=request.user.id).update(last_activity=timezone.now())
            else:
                Specialists.objects.filter(pk=request.user.id).update(last_activity=timezone.now())
