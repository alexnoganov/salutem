from django import template
from django.utils import timezone

register = template.Library()


@register.filter
def sub(self):
    if (self - timezone.now()).days > -3:
        return True
    else:
        return False
