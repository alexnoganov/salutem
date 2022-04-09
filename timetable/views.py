import datetime
import json

from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Q
from django.http import HttpResponseRedirect, JsonResponse, Http404
from django.urls import reverse_lazy
from django.utils.timezone import utc
from django.views.generic import TemplateView, ListView
from django.utils.translation import gettext as _

from patients.models import Analyzes
from timetable.models import TimeTable
from user.models import Specialists


class TimeTableView(ListView):
    template_name = 'timetable/timetable.html'
    context_object_name = 'specialists'
    paginate_by = 30

    def get(self, request, *args, **kwargs):
        self.object_list = self.get_queryset()
        allow_empty = self.get_allow_empty()
        context = self.get_context_data()
        now = datetime.datetime.now().replace(hour=0, minute=0, second=0, microsecond=0, tzinfo=utc)
        TimeTable.objects.filter(date__lte=now).delete()

        if not allow_empty:
            if self.get_paginate_by(self.object_list) is not None and hasattr(self.object_list, 'exists'):
                is_empty = not self.object_list.exists()
            else:
                is_empty = not self.object_list
            if is_empty:
                raise Http404(_('Empty list and “%(class_name)s.allow_empty” is False.') % {
                    'class_name': self.__class__.__name__,
                })

        if self.request.user.is_staff:
            return self.render_to_response(context)
        else:
            return HttpResponseRedirect(reverse_lazy('timetable_analyzes'))
        # if kwargs.get('pk'):
        #     if self.request.user.is_staff:
        #         return self.render_to_response(context)
        #     else:
        #         return HttpResponseRedirect(reverse_lazy('timetable_analyzes'))
        # else:
        #     return self.render_to_response(context)

    def get_queryset(self):
        if self.request.user.is_staff and not self.kwargs.get('pk'):
            if self.request.GET.get('q'):
                search = self.request.GET.get('q')
                return Specialists.objects.filter(
                    Q(first_name__icontains=search) | Q(last_name__icontains=search) | Q(
                        patronymic__icontains=search) | Q(phone__icontains=search) | Q(
                        email__icontains=search)).order_by('-last_login')
            else:
                return Specialists.objects.all().order_by('-last_login')
        else:
            return Specialists.objects.none()

    def get_context_data(self, **kwargs):
        context = super(TimeTableView, self).get_context_data()
        if self.request.user.is_staff:
            if self.kwargs.get('pk'):
                timetable = TimeTable.objects.filter(specialist_id=self.kwargs['pk']).order_by('date')
                context['timetable'] = get_data_for_timetable(timetable, False)
                return context
            else:
                return context
        else:
            timetable = TimeTable.objects.filter(specialist_id=self.request.user.pk).order_by('date')
            context['timetable'] = get_data_for_timetable(timetable, False)
            return context


class TimeTableAnalyzesView(TemplateView):
    template_name = 'timetable/timetable.html'

    def get_context_data(self, **kwargs):
        context = super(TimeTableAnalyzesView, self).get_context_data()
        timetable = Analyzes.objects.filter(status='Новый')
        context['timetable_analyzes'] = get_data_for_timetable(timetable, True)
        return context


def delete_appointment(request):
    if request.POST.get('pk'):
        try:
            TimeTable.objects.get(pk=request.POST.get('pk')).delete()
            return JsonResponse({'success': 'success'}, safe=False)
        except ObjectDoesNotExist:
            return JsonResponse({'error': 'error'}, safe=False)
    else:
        return JsonResponse({'error': 'error'}, safe=False)


def get_data_for_timetable(timetable, types):
    data = {}

    def get_data():
        if types:
            return ['{f} {i} {o}'.format(f=timetable[i].patient.Surname, i=timetable[i].patient.Name,
                                         o=timetable[i].patient.Patronymic),
                    timetable[i].date.strftime("%d.%m.%Y %H:%M"),
                    timetable[i].patient.pk,
                    timetable[i].pk,
                    timetable[i].type.title]
        else:
            return ['{f} {i} {o}'.format(f=timetable[i].patient.Surname, i=timetable[i].patient.Name,
                                         o=timetable[i].patient.Patronymic),
                    timetable[i].date.strftime("%d.%m.%Y %H:%M"),
                    timetable[i].patient.pk,
                    timetable[i].pk]

    for i in range(0, len(timetable)):
        data[timetable[i].date.isocalendar().week] = {
            0: [],
            1: [],
            2: [],
            3: [],
            4: [],
            5: [],
            6: [],
        }
    for i in range(0, len(timetable)):
        for key in data:
            if timetable[i].date.isocalendar().week == key:
                for k in data[key]:
                    if timetable[i].date.weekday() == k:
                        data[key][k].append(get_data())
    data = json.dumps(data)

    return data
