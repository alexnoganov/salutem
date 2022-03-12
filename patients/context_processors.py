from .models import Analyzes


def analyzes_notification(request):
    return {
        'analyzes_notify': Analyzes.objects.filter(status__in=('Новый', 'Завершен')).order_by('-date_of_change'),
    }
