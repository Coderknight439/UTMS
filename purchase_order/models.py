from django.contrib.auth.models import User
from django.db import models
from vendor.models import Vendor


class PurchaseInvoice(models.Model):
	purchase_id = models.CharField(max_length=200, verbose_name='Purchase ID', unique=True)
	vendor_id = models.ForeignKey(Vendor, on_delete=models.CASCADE, verbose_name='Vendor')
	purpose = models.TextField(max_length=1024, verbose_name='Purpose')
	entry_date = models.DateField(auto_now_add=True)
	amount = models.DecimalField(max_digits=20, decimal_places=4)
	created_by = models.ForeignKey(User, on_delete=models.CASCADE)

	class Meta:
		db_table = 'purchase_invoice'


class PurchaseProduct(models.Model):
	product_name = models.CharField(max_length=256, verbose_name='Product')
	purchase_id = models.ForeignKey(PurchaseInvoice, to_field='purchase_id', on_delete=models.CASCADE)
	quantity = models.IntegerField(default=1)
	mrp = models.DecimalField(max_digits=15, decimal_places=4)

	class Meta:
		db_table = 'purchase_product'
