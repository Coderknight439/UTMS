from django.shortcuts import render, redirect, HttpResponseRedirect

from transport_schedule.models import TransportSchedule
from .models import TransportSchedule


def index(request, **kwargs):
	schedule = TransportSchedule.objects.all()
	return render(request, 'transport_schedule/index.html', {'schedule': schedule, 'title': 'Schedule List' })


def view(request, vehicle_number, **kwargs):
	schedule = TransportSchedule.objects.get(vehicle_route=vehicle_number)
	return render(request, 'vehicle/view.html', {
		'title': "Schedule for "+ str(schedule.vehicle_route),
		'schedule': schedule,
	})
