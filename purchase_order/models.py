from django.contrib.auth.models import User
from django.db import models
from ledgers.models import Ledger
from vehicle.models import VehicleInfo
from vendor.models import Vendor


class PurchaseInvoice(models.Model):
	purchase_id = models.CharField(max_length=200, verbose_name='Purchase ID', unique=True)
	vendor_id = models.ForeignKey(Vendor, on_delete=models.CASCADE, verbose_name='Vendor')
	vehicle_id = models.ForeignKey(VehicleInfo, on_delete=models.CASCADE, verbose_name='Vehicle')
	purpose = models.TextField(max_length=1024, verbose_name='Purpose')
	entry_date = models.DateField(auto_now_add=True)
	amount = models.DecimalField(max_digits=20, decimal_places=4)
	created_by = models.ForeignKey(User, on_delete=models.CASCADE)


	def __str__(self):
		return '{}'.format(self.purchase_id)

	class Meta:
		db_table = 'purchase_invoice'

	def total_amount(self):
		total = 0
		for p in self.purchaseproduct_set.all():
			raw_total = (p.quantity * p.mrp)
			if p.discount != 0:
				total += raw_total-raw_total*(p.discount/100)
			else:
				total+=raw_total
		self.amount = total
		self.save()
		ledger = Ledger.objects.create(
			voucher_id = self.purchase_id,
			account_id = Vendor.objects.get(pk=self.vendor_id_id).vendor_id,
			entry_date = self.entry_date,
			amount = self.amount*(-1)
		)
		ledger.save()



class PurchaseProduct(models.Model):
	product_name = models.CharField(max_length=256, verbose_name='Product')
	purchase_id = models.ForeignKey(PurchaseInvoice, to_field='purchase_id', on_delete=models.CASCADE)
	quantity = models.IntegerField(default=1)
	mrp = models.DecimalField(max_digits=15, decimal_places=4)
	discount = models.IntegerField(default=0, blank=True, null=True)

	class Meta:
		db_table = 'purchase_product'
