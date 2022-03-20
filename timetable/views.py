import json

from django.core.exceptions import ObjectDoesNotExist
from django.http import HttpResponseRedirect, JsonResponse
from django.urls import reverse_lazy
from django.views.generic import TemplateView

from timetable.models import TimeTable


class TimeTableView(TemplateView):
    template_name = 'timetable/timetable.html'

    def get(self, request, *args, **kwargs):
        if kwargs.get('pk'):
            if self.request.user.is_staff:
                if self.request.user.pk == kwargs.get('pk'):
                    return HttpResponseRedirect(reverse_lazy('timetable'))
                else:
                    context = self.get_context_data(**kwargs)
                    return self.render_to_response(context)
            else:
                return HttpResponseRedirect(reverse_lazy('timetable'))
        else:
            context = self.get_context_data(**kwargs)
            return self.render_to_response(context)

    def get_context_data(self, **kwargs):
        context = super(TimeTableView, self).get_context_data()
        if kwargs.get('pk'):
            timetable = TimeTable.objects.filter(specialist_id=kwargs['pk']).order_by('date')
        else:
            timetable = TimeTable.objects.filter(specialist_id=self.request.user.pk).order_by('date')
        context['timetable'] = {}
        for i in range(0, len(timetable)):
            context['timetable'][timetable[i].date.isocalendar().week] = {
                0: [],
                1: [],
                2: [],
                3: [],
                4: [],
                5: [],
                6: [],
            }
        for i in range(0, len(timetable)):
            for key in context['timetable']:
                if timetable[i].date.isocalendar().week == key:
                    for k in context['timetable'][key]:
                        if timetable[i].date.weekday() == k:
                            context['timetable'][key][k].append([
                                '{f} {i} {o}'.format(f=timetable[i].patient.Surname, i=timetable[i].patient.Name,
                                                     o=timetable[i].patient.Patronymic),
                                timetable[i].date.strftime("%d.%m.%Y %H:%M"),
                                timetable[i].patient.pk,
                                timetable[i].pk
                            ])
        context['timetable'] = json.dumps(context['timetable'])

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
