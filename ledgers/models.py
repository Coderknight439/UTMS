from django.db import models


class Ledger(models.Model):
	voucher_id = models.CharField(max_length=100, verbose_name='Voucher')
	account_id = models.CharField(max_length=200, verbose_name='Party')
	entry_date = models.DateField(auto_now_add=True)
	amount = models.DecimalField(max_digits=50, decimal_places=4)

	class Meta:
		db_table = 'ledgers'
