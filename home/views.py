import datetime
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Q
from django.shortcuts import render, redirect, get_object_or_404
from accounts.models import Student, Teacher
from complaint.forms import ComplaintFeedbackForm
from complaint.models import Complaint
from ticketing.models import TicketSale
from transport_schedule.models import TransportSchedule
from vehicle.models import VehicleInfo
from ticketing.forms import TicketForm


@login_required(login_url='/')
def index(request, **kwargs):
    username = request.user
    transport_schedule = TransportSchedule.objects.filter(start_time__gte=datetime.datetime.now().time())[:3]
    complaint = Complaint.objects.filter(complaint_by=username)[:3]
    vehicle = VehicleInfo.objects.order_by('?')[:3]
    tickets = TicketSale.objects.filter(issued_for=request.user.username)[:3]
    feedback_form = ComplaintFeedbackForm
    try:
        teacher_username = Teacher.objects.get(email=username)
    except ObjectDoesNotExist:
        teacher_username = None
    try:
        student_username = Student.objects.filter(Q(student_id=username) | Q(email=username))
    except ObjectDoesNotExist:
        student_username = None
    if teacher_username is not None:
        user_name = teacher_username[0]
        return render(request, 'passenger/index.html',
                      {
                          'title': 'UTMS Home',
                          'username': user_name,
                          'schedule': transport_schedule,
                          'complaint': complaint,
                          'vehicle': vehicle,
                          'tickets': tickets,
                          'feedback_form': feedback_form
                      })
    else:
        user_name = student_username[0]
        return render(request, 'passenger/index.html',
                      {
                          'title': 'UTMS Home',
                          'username': user_name,
                          'schedule': transport_schedule,
                          'complaint': complaint,
                          'vehicle': vehicle,
                          'tickets': tickets,
                          'form': TicketForm,
                          'feedback_form': feedback_form
                      })
