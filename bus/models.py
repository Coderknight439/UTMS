from django.db import models
from drivers.models import Driver
from route.models import RouteInfo
from choices import vehicle_color, vehicle_type, vehicle_status


class VehicleInfo(models.Model):
	vehicle_number = models.CharField(max_length=50, verbose_name='Vehicle ID', unique=True,)
	color = models.CharField(max_length=20, choices=vehicle_color, verbose_name='Color')
	vehicle_type = models.CharField(max_length=20, choices=vehicle_type, verbose_name='Type')
	license_number = models.CharField(max_length=100, verbose_name='License No.')
	engine = models.CharField(max_length=100, blank=True, verbose_name='Engine')
	capacity = models.IntegerField(max_length=10, verbose_name='Capacity')
	status = models.CharField(max_length=20, choices=vehicle_status, verbose_name='Status')
	route = models.ForeignKey(RouteInfo, on_delete=models.CASCADE, verbose_name='Route')
	driver = models.ForeignKey(Driver, null=True, blank=True, on_delete=models.CASCADE)


