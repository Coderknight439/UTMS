import datetime
from django.db import models


class RouteInfo(models.Model):
    route_number = models.CharField(max_length=100, unique=True, verbose_name='Route No.')
    display_text = models.CharField(max_length=200, verbose_name='Route')
    start_stoppage = models.CharField(max_length=100, verbose_name='From')
    destination = models.CharField(max_length=100, verbose_name='To')
    slug = models.SlugField(max_length=100, unique=True, default='', editable=False)
    created_by = models.CharField(max_length=200, blank=True, verbose_name='Created By', default=None)
    updated_by = models.CharField(max_length=200, blank=True, verbose_name='Created By', default=None)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return '{}'.format(self.display_text)

