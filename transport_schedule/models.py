from django.db import models
from django.db.models import Q

from vehicle.models import VehicleInfo


def vehicle():
	vehicle_info = VehicleInfo.objects.filter(Q(is_scheduled=False) & Q(status__in=[0, 2]))
	return {'pk__in': vehicle_info}


class TransportSchedule(models.Model):
	vehicle_route = models.ForeignKey(VehicleInfo, on_delete=models.CASCADE, verbose_name='Vehicle',
						limit_choices_to=vehicle, related_name='vehicle', to_field='vehicle_number')
	start_time = models.TimeField(verbose_name='Start Time')
	et = models.TimeField(blank=True, verbose_name='ET')

	class Meta:
		db_table = 'transport_schedule'

	def __str__(self):
		return "{} has been scheduled for {}".format(self.vehicle_route, self.start_time)
