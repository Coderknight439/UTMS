import datetime
from django.db import models
from route.models import RouteInfo


class Stoppage(models.Model):
    location = models.CharField(max_length = 100, verbose_name = 'stoppage')
    route_id = models.ForeignKey(RouteInfo, on_delete = models.CASCADE, related_name = 'route', blank = True, null = True)
    slug = models.SlugField(max_length = 100, unique = True, default = '', editable = False)
    created_by = models.CharField(max_length = 200, blank = True, verbose_name = 'Created By', default = None)
    updated_by = models.CharField(max_length = 200, blank = True, verbose_name = 'Created By', default = None)
    created_date = models.DateTimeField(max_length = 200, blank = True, default = datetime.datetime.now())
    updated_date = models.DateTimeField(max_length = 200, blank = True, default = datetime.datetime.now())