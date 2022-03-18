from django.views.generic import TemplateView

from timetable.models import TimeTable


class TimeTableView(TemplateView):
    template_name = 'timetable/timetable.html'

    def get_context_data(self, **kwargs):
        context = super(TimeTableView, self).get_context_data()
        context['timetable'] = TimeTable.objects.filter(specialist_id=self.request.user.pk).order_by('date')
        return context
