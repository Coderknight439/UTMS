import datetime
from django.contrib import messages
from django.contrib import admin
from ledgers.models import Ledger
from .models import TicketSale, TicketInfo


@admin.register(TicketInfo)
class TicketInfoAdmin(admin.ModelAdmin):
	exclude = ['created_by', 'created_date', 'updated_by', 'updated_date']
	list_display = ('id', 'ticket_type', 'unit_price', 'discount', 'Validate_for', 'discount_purpose')
	list_filter = ('ticket_type',)
	list_editable = ('unit_price', 'discount', 'Validate_for', 'discount_purpose')
	search_fields = ['ticket_type']
	ordering = ['id']

	def save_model(self, request, obj, form, change):
		if obj.id == '':
			obj.created_by = str(request.user)
		else:
			obj.updated_by = str(request.user)
		super().save_model(request, obj, form, change)


@admin.register(TicketSale)
class TicketSaleAdmin(admin.ModelAdmin):
	exclude = ['payment_date', 'applied_date', 'status', 'issued_by', 'ticket_number', 'expiry_date', 'total_amount', 'voucher_number']
	list_display = ('ticket_number', 'ticket_type', 'issued_for', 'status', 'total_amount', 'issued_by', 'paid_amount')
	list_filter = ('ticket_number', 'ticket_type')
	list_editable = ('status', 'paid_amount')
	search_fields = ['ticket_number']
	ordering = ['applied_date']

	def get_readonly_fields(self, request, obj=None):
		if obj and obj.status == 3:
			self.readonly_fields+=('status',)
		if request.user.is_staff:
			return ['ticket_type', 'issued_for',  'issued_for', 'ticket_number']

	def save_model(self, request, obj, form, change):
		status = obj.get_status_display()
		if status == 'Closed':
			obj.issued_by = str(request.user.username)
			obj.payment_date = datetime.datetime.today()
			obj.expiry_date = obj.payment_date + datetime.timedelta(days = int(obj.ticket_type))
			if obj.voucher_number == '':
				obj.voucher_number = 'SI-'+str(obj.ticket_number[2:])
				ledger = Ledger.objects.create(
					voucher_id=obj.voucher_number,
					account_id=obj.issued_for,
					amount=obj.total_amount
				)
				ledger.save()
		if status == 'Accepted':
			pass
		if status == 'Rejected':
			pass
		super().save_model(request, obj, form, change)
