from django.db import models
from drivers.models import Driver, Staff
from route.models import RouteInfo
from choices import vehicle_color, vehicle_type, vehicle_status


class VehicleInfo(models.Model):
	vehicle_number = models.CharField(max_length=50, verbose_name='Vehicle ID', unique=True, default="")
	color = models.CharField(max_length=20, choices=vehicle_color, verbose_name='Color')
	vehicle_type = models.CharField(max_length=20, choices=vehicle_type, default=0, verbose_name='Type')
	license_number = models.CharField(max_length=100, verbose_name='License No.')
	engine = models.CharField(max_length=100, blank=True, verbose_name='Engine')
	capacity = models.IntegerField(verbose_name='Capacity')
	status = models.CharField(max_length=20, choices=vehicle_status, default=0, verbose_name='Status')
	route = models.ForeignKey(RouteInfo, on_delete=models.CASCADE, verbose_name='Route')
	driver = models.OneToOneField(Driver, null=True, blank=True, on_delete=models.CASCADE, limit_choices_to={'is_free': True})
	staff = models.OneToOneField(Staff, null=True, blank = True, on_delete = models.CASCADE, limit_choices_to={'is_free': True})
	is_scheduled = models.BooleanField(default=False, verbose_name='Scheduled', blank=True)

	def __str__(self):
		return '{}'.format(self.vehicle_number)


