from django.contrib import admin
from .models import *


class ProductInline(admin.TabularInline):
	model = PurchaseProduct


@admin.register(PurchaseInvoice)
class PurchaseInvoiceAdmin(admin.ModelAdmin):
	exclude = ['entry_date', 'amount', 'created_by']
	inlines = [
		ProductInline
	]
