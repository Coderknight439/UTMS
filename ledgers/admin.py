from django.contrib import admin
from .models import Ledger


@admin.register(Ledger)
class LedgerAdmin(admin.ModelAdmin):
	list_filter = ['account_id', 'voucher_id']
	search_fields = ['voucher_id']
	ordering = ['entry_date']
