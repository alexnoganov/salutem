from .models import Analyzes


def analyzes_notification(request):
    return {
        'analyzes_notify': Analyzes.objects.all()
    }
