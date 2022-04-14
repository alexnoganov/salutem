import json
# import os.path
# from io import StringIO
# import urllib
# from urllib.error import HTTPError
# from urllib.parse import urlencode
# from urllib.request import urlopen

# import weasyprint
# import wkhtmltopdf
# from django.core.mail import send_mail, EmailMultiAlternatives, EmailMessage
# from wkhtmltopdf.views import PDFTemplateResponse

# import pdfkit
from django.http import JsonResponse
# from django.template.loader import get_template, render_to_string
# from django.utils.translation import gettext_lazy as _
from django.views.generic import ListView
# from xhtml2pdf import pisa

from patients.models import Patients
from sicklist.models import sickList
from user.models import Specialists


# os.add_dll_directory(r"C:\Program Files\GTK3-Runtime Win64\bin")


class sickListPatient(ListView):
    template_name = 'sicklist/sicklist.html'
    model = sickList
    context_object_name = 'sickListAll'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        context['patient'] = Patients.objects.get(id=self.kwargs['pk'])
        context['specialist'] = Specialists.objects.filter(id=self.kwargs['pk'])

        # config = pdfkit.configuration(wkhtmltopdf='C:\\Program Files\\wkhtmltopdf\\bin\\wkhtmltopdf.exe')
        # html = render_to_string('pdf_template.html', context)
        # pdf = weasyprint.HTML("http://127.0.0.1:8000/patients/profile/1/sicklist/").write_pdf()
        # to_emails = ['santa2344@gmail.com']
        # subject = "Certificate from Nami Montana"
        # email = EmailMessage(subject, body=pdf, from_email=settings.EMAIL_HOST_USER, to=to_emails)
        # email.attach('file.pdf', pdf, "application/pdf")
        # email.content_subtype = "pdf"  # Main content is now text/html
        # email.encoding = 'us-ascii'
        # email.send()
        #
        # template = get_template('pdf_template.html').render(context)
        #
        # api_endpoint = 'https://selectpdf.com/api2/convert/'
        # key = 'b61372ad-4165-4813-b639-78f5be984a75'
        # test_url = 'https://selectpdf.com'#ссылка на распечатку
        # local_file = 'test.pdf'
        #
        # parameters = {
        #     'key': key,
        #     'url': test_url,
        # }
        #
        # requesturl = api_endpoint + '?' + urlencode(parameters)
        # print("Calling {0}\n".format(requesturl))
        # try:
        #     result = urlopen(requesturl)
        #     localFile = open(local_file, 'wb')
        #     localFile.write(result.read())
        #     localFile.close()
        #     print("Test pdf document generated successfully!")
        # except HTTPError as e:
        #     print("HTTP Response Code: {0}\nHTTP Response Message: {1}".format(e.code, e.reason))
        # except:
        #     print("An error occurred!")
        return context


def addSickList(request, pk):
    if request.method == 'POST':
        try:
            data = json.loads(request.POST.get('data'))
            checkbox = json.loads(request.POST.get('checkbox'))
            sickList.objects.create(md_organization=data[0], address_of_md_organization=data[1], dateIssue=data[2],
                                    orgn=data[3], disability_code=data[4], disability_code_addit=data[5],
                                    place_of_work=data[6], based=checkbox[0], currently=checkbox[1],
                                    number_work=data[7], public_organizations=checkbox[2], from_what_date=data[8],
                                    by_what_number=data[9], patient_id=pk, specialist_id=request.user.pk)
        except KeyError:
            data = json.loads(request.POST.get('data'))
            checkbox = json.loads(request.POST.get('checkbox'))
            sickList.objects.create(md_organization=data[0], address_of_md_organization=data[1], dateIssue=data[2],
                                    orgn=data[3], disability_code=data[4], disability_code_addit=data[5],
                                    place_of_work=data[6], based=checkbox[0], currently=checkbox[1],
                                    number_work=data[7], from_what_date=data[8], by_what_number=data[9], patient_id=pk,
                                    specialist_id=request.user.pk)
        return JsonResponse({'success': 'success'}, safe=False)
    return JsonResponse({'errors': 'errors'}, safe=False)