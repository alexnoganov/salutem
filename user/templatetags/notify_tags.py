from django import template
from django.utils import timezone

register = template.Library()


@register.filter
def sub(self):
    if (self.date_of_change - timezone.now()).days > -3:
        return True
    else:
        self.show = False
        self.save()
        return False
