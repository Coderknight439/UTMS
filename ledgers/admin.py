from django.contrib import admin
from .models import Ledger


@admin.register(Ledger)
class LedgerAdmin(admin.ModelAdmin):
	list_filter = ['account_id', 'voucher_id']
	list_display = ['voucher_id', 'account_id', 'amount', 'entry_date']
	ordering = ['entry_date']
