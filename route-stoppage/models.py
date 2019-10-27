from django.db import models
from route.models import RouteInfo
from stoppage.models import Stoppage


class RouteStoppage(models.Model):
	route = models.ForeignKey(RouteInfo, on_delete=models.CASCADE, verbose_name='Route')
	stoppage = models.ForeignKey(Stoppage, on_delete=models.CASCADE, verbose_name='Stoppage')

	def __str__(self):
		return '{} to route {}'.format(self.stoppage, self.route)
