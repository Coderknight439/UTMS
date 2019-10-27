import datetime
from django.db import models
from route.models import RouteInfo


class Stoppage(models.Model):
    location = models.CharField(max_length=100, verbose_name='stoppage')
    created_by = models.CharField(max_length=200, blank=True, verbose_name='Created By', default=None)
    updated_by = models.CharField(max_length=200, blank=True, verbose_name='Created By', default=None)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return '{}'.format(self.location)
