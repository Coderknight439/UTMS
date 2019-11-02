import datetime
from django.db import models
from choices import complaint_type, complaint_status
from vehicle.models import VehicleInfo


class Complaint(models.Model):
    complaint_type = models.CharField(max_length=100, choices=complaint_type, verbose_name='Type')
    incident_date = models.DateField(blank=True, verbose_name='Incident Date')
    complaint_date = models.DateTimeField(verbose_name='Complaint Date', auto_now_add=True)
    complaint_by = models.CharField(max_length=200, blank = False)
    accepted_by = models.CharField(max_length=100, verbose_name='Accepted By')
    updated_by = models.DateField(auto_now=True)
    status = models.CharField(max_length=200, choices=complaint_status, default=complaint_status[0][0])
    bus_number = models.ForeignKey(VehicleInfo, on_delete=models.CASCADE)
    description = models.TextField(max_length=500, blank=True)

    def __str__(self):
        return "{}".format(self.complaint_type)

    class Meta:
        ordering = ['complaint_type', 'complaint_date']
