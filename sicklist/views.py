import json
import os.path
from io import StringIO
from wkhtmltopdf.views import PDFTemplateResponse

import pdfkit
from django.db.models import Q
from django.http import JsonResponse, Http404
from django.shortcuts import render
from django.template import Context
from django.template.loader import get_template
from django.utils.translation import gettext_lazy as _
from django.views.generic import ListView, DetailView
from django.http import HttpResponse
from xhtml2pdf import pisa

from patients.models import Patients
from salutem import settings
from sicklist.models import sickList
from user.models import Specialists


class sickListPatient(ListView):
    template_name = 'sicklist/sicklist.html'
    model = sickList
    context_object_name = 'sickListAll'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        context['patient'] = Patients.objects.get(id=self.kwargs['pk'])
        context['specialist'] = Specialists.objects.filter(id=self.kwargs['pk'])
        config = pdfkit.configuration(wkhtmltopdf='C:\\Program Files\\wkhtmltopdf\\bin\\wkhtmltopdf.exe')
        # pdfkit.from_url(self.request.get_host() + self.request.get_full_path_info(), 'test.pdf', configuration=config)
        # pdf = render_to_pdf("C:\\Users\\santa\\Desktop\salutem\\sicklist\\templates\\email\\pdf_template.html", context)
        template_name = 'pdf_template.html'
        filename = 'test.pdf'

        # generate response
        response = PDFTemplateResponse(
            request=self.request,
            template=template_name,
            filename=filename,
            context=context,
            cmd_options={'load-error-handling': 'ignore'})
        # file = open(settings.MEDIA_ROOT + '/' + filename, "wb")
        # file.write(response.rendered_content)

        # write the rendered content to a file
        # with open(settings.MEDIA_ROOT + '/' + filename, "wb") as f:
        #     f.write(response.rendered_content)
        return context


def addSickList(request, pk):
    if request.method == 'POST':
        try:
            data = json.loads(request.POST.get('data'))
            print(data)
            pass
        except KeyError:
            pass
        return JsonResponse({'success': 'success'}, safe=False)
    return JsonResponse({'errors': 'errors'}, safe=False)


# def render_to_pdf(template_src, context_dict={}):
#     def link_callback(uri, rel):
#         # use short variable names
#         sUrl = settings.STATIC_URL  # Typically /static/
#         sRoot = settings.STATIC_ROOT  # Typically /home/userX/project_static/
#         mUrl = settings.MEDIA_URL  # Typically /static/media/
#         mRoot = settings.MEDIA_ROOT  # Typically /home/userX/project_static/media/
#
#         # convert URIs to absolute system paths
#         if uri.startswith(mUrl):
#             path = os.path.join(mRoot, uri.replace(mUrl, ""))
#         elif uri.startswith(sUrl):
#             path = os.path.join(sRoot, uri.replace(sUrl, ""))
#
#         # make sure that file exists
#         if not os.path.isfile(path):
#             raise Exception(
#                 'media URI must start with %s or %s' % \
#                 (sUrl, mUrl))
#         return path
#     template = get_template(template_src)
#     html = template.render(context_dict)
#     result = BytesIO()
#     pdf = pisa.pisaDocument(BytesIO(html.encode("UTF8")), result)
#     print(pdf)
#     file = open(os.path.join(settings.MEDIA_ROOT, "test.pdf"), "w+b")
#     pisa_status = pisa.CreatePDF(html, dest=file, link_callback=link_callback)
#     print(pisa_status)
#     if not pdf.err:
#         return HttpResponse(result.getvalue(), content_type='application/pdf')
#     return None

# def serve_pdf(invoice, request):
#     # Convert HTML URIs to absolute system paths so xhtml2pdf can access those resources
#
#     def link_callback(uri, rel):
#         # use short variable names
#         sUrl = settings.STATIC_URL  # Typically /static/
#         sRoot = settings.STATIC_ROOT  # Typically /home/userX/project_static/
#         mUrl = settings.MEDIA_URL  # Typically /static/media/
#         mRoot = settings.MEDIA_ROOT  # Typically /home/userX/project_static/media/
#
#         # convert URIs to absolute system paths
#         if uri.startswith(mUrl):
#             path = os.path.join(mRoot, uri.replace(mUrl, ""))
#         elif uri.startswith(sUrl):
#             path = os.path.join(sRoot, uri.replace(sUrl, ""))
#
#         # make sure that file exists
#         if not os.path.isfile(path):
#             raise Exception(
#                 'media URI must start with %s or %s' % \
#                 (sUrl, mUrl))
#         return path
#
#     # Render html content through html template with context
#     template = get_template("pdf_template.html")
#     html = template.render(Context(invoice))
#
#     # Write PDF to file
#     # file = open(os.path.join(settings.MEDIA_ROOT, 'Invoice #' + str(id) + '.pdf'), "w+b")
#     file = StringIO()
#     pisaStatus = pisa.CreatePDF(html, dest=file, link_callback=link_callback)
#
#     # Return PDF docuement through a Django HTTP response
#     file.seek(0)
#     # pdf = file.read()
#     # file.close()            # Don't forget to close the file handle
#     return HttpResponse(file, content_type='application/pdf')
