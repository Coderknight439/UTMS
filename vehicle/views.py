from django.shortcuts import render, redirect, HttpResponseRedirect

from transport_schedule.models import TransportSchedule
from .models import VehicleInfo


def index(request, **kwargs):
	vehicle = VehicleInfo.objects.all()
	return render(request, 'vehicle/index.html', {'vehicle': vehicle, 'title': 'Vehicle List' })


def view(request, vehicle_number, **kwargs):
	vehicle = VehicleInfo.objects.get(vehicle_number=vehicle_number)
	schedule = TransportSchedule.objects.get(vehicle_route=vehicle_number)
	return render(request, 'vehicle/view.html', {
		'vehicle': vehicle,
		'title': vehicle.vehicle_number,
		'schedule': schedule,
	})

