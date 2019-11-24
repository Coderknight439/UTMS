from django.db import models
from django.utils.html import format_html

from .urls import urlpatterns


def url_list():
	i = 0
	patterns = []
	for url in urlpatterns:
		patterns.append((str(i), url.name))
		i += 1
	return patterns


class Reports(models.Model):
	name = models.CharField(max_length=300, verbose_name='Readable Name')
	url = models.CharField(max_length=300, choices=url_list(), verbose_name='URL')

	def __str__(self):
		return "{}".format(self.name)

	class Meta:
		db_table = 'Reports'
		verbose_name = 'Reports'
		verbose_name_plural = 'Reports'


