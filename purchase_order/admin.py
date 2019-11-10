from django.contrib import admin
from .models import *


class ProductInline(admin.TabularInline):
	model = PurchaseProduct
	extra = 1
	can_delete = False


@admin.register(PurchaseInvoice)
class PurchaseInvoiceAdmin(admin.ModelAdmin):
	exclude = ['entry_date', 'amount', 'created_by']
	inlines = [
		ProductInline
	]

	def save_model(self, request, obj, form, change):
		obj.amount = 0
		obj.created_by = request.user
		super().save_model(request, obj, form, change)

	def save_formset(self, request, form, formset, change):
		pass
