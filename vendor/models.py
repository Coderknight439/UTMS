from django.db import models


class Vendor(models.Model):
	name = models.CharField(max_length=200, verbose_name='Vendor', unique=True)
	address_line_1 = models.CharField(max_length=512, verbose_name='Address-1')
	address_line_2 = models.CharField(max_length=512, blank=True, verbose_name='Address-2')
	contact_person = models.CharField(max_length=256, verbose_name='Contact Person')
	contact_number = models.CharField(max_length=15, verbose_name='Phone')
	email = models.EmailField(blank=True)

	def __str__(self):
		return "{}".format(self.name)

	class Meta:
		db_table = 'vendors'
