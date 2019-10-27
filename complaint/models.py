import datetime
from django.utils import timezone
from django.db import models
from choices import complaint_type, complaint_status
from vehicle.models import VehicleInfo



class Complaint(models.Model):
    complaint_type = models.CharField(max_length = 100, choices = complaint_type, verbose_name = 'Type')
    incident_date = models.DateField(blank = True, default = timezone.now, verbose_name = 'Incident Date')
    complaint_date = models.DateTimeField(default = timezone.now, verbose_name = 'Complaint Date')
    complaint_by = models.CharField(max_length = 200, blank = False)
    accepted_by = models.CharField(max_length = 100, verbose_name = 'Accepted By')
    status = models.CharField(max_length = 200, choices = complaint_status, default = complaint_status[0][0])
    bus_number = models.ForeignKey(VehicleInfo, on_delete = models.CASCADE, blank = True, null = True)

    def __str__(self):
        return "{}".format(self.complaint_type)


    class Meta:
        ordering = ['complaint_type', 'complaint_date']
