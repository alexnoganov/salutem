from django import template

register = template.Library()


@register.filter(name='split')
def split(value, splitter):
    print(value.split(splitter))
    return value.split(splitter)