import datetime
from django.db import models
from choices import complaint_type, complaint_status
from bus.models import VehicleInfo


class Complaint(models.Model):
	complaint_type = models.CharField(max_length=100, choices=complaint_type, verbose_name='Type')
	incident_date = models.DateField(blank=True, default=datetime.datetime.now(), verbose_name='Incident Date')
	complaint_date = models.DateTimeField(default=datetime.datetime.now(), verbose_name='Complaint Date')
	complaint_by = models.CharField(max_length=200, blank=False)
	accepted_by = models.CharField(max_length=100, verbose_name='Accepted By')
	status = models.CharField(max_length=200, choices=complaint_status, default=complaint_status[0][0])
	bus_number = models.ForeignKey(VehicleInfo, on_delete=models.CASCADE)

