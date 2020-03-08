import datetime

from django.core.exceptions import ObjectDoesNotExist
# from rangefilter.filter import DateRangeFilter, DateTimeRangeFilter
from django.contrib import admin
from ledgers.models import Ledger
from .models import TicketSale, TicketInfo, TicketDiscount


@admin.register(TicketInfo)
class TicketInfoAdmin(admin.ModelAdmin):
	exclude = ['created_by', 'created_date', 'updated_by', 'updated_date']
	list_display = ('id', 'ticket_type', 'unit_price')
	list_filter = ('ticket_type',)
	list_editable = ('unit_price',)
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
	exclude = ['payment_date', 'applied_date', 'status',  'issued_by', 'ticket_number', 'expiry_date', 'total_amount', 'voucher_number', 'issued_for']
	list_display = ('ticket_number', 'applied_date', 'vehicle_id', 'ticket_type', 'issued_for', 'status', 'total_amount', 'issued_by', 'paid_amount', 'due')
	list_filter = ('ticket_number', 'ticket_type', 'applied_date', 'status')
	list_editable = ('status', 'paid_amount',)
	search_fields = ['ticket_number']
	ordering = ['-applied_date']

	def get_readonly_fields(self, request, obj=None):
		if obj and obj.status == 3:
			self.readonly_fields+=('status',)
		if request.user.is_staff:
			return ['ticket_type', 'issued_for',  'issued_for', 'ticket_number', 'applied_date', 'total_amount', 'braintree_id', 'vehicle_id']

	def save_model(self, request, obj, form, change):
		status = obj.get_status_display()
		if status == 'Closed':
			obj.issued_by = str(request.user.username)
			obj.payment_date = datetime.datetime.today()
			obj.expiry_date = obj.payment_date + datetime.timedelta(days=int(obj.ticket_type))
			try:
				available_discount = TicketDiscount.objects.get(start_date__lte=obj.payment_date, end_date__gte=obj.payment_date).discount
			except ObjectDoesNotExist:
				available_discount = 0
			if available_discount != 0:
				obj.total_amount = float(obj.total_amount)-float(obj.total_amount)*(available_discount/100)
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


@admin.register(TicketDiscount)
class DiscountAdmin(admin.ModelAdmin):
	list_display = ['id', 'discount', 'discount_purpose', 'start_date', 'end_date']
	list_editable = ['discount']
	ordering = ['id']
	# search_fields = ['start_date']

	def save_model(self, request, obj, form, change):
		# import pdb; pdb.set_trace()
		discount = float(obj.discount)/100
		# validate_for = (obj.end_date - obj.start_date).days
		within_offer = TicketSale.objects.filter(expiry_date__gte=obj.start_date, expiry_date__lte=obj.end_date)
		# import pdb;pdb.set_trace()
		if within_offer is not None:
			for row in within_offer:
				offer_days = (row.expity_date-obj.start_date).days
				row.total_amount = float(row.total_amount)-((float(row.unit_price)*offer_days)*discount)
				row.save(update_fields=['total_amount'])
		over_offer = TicketSale.objects.filter(expiry_date__gt=obj.end_date)
		if over_offer is not None:
			for row in over_offer:
				offer_days = (row.expity_date - obj.start_date).days
				row.total_amount = float(row.total_amount)-((float(row.unit_price)*offer_days)*discount)
				row.save(update_fields=['total_amount'])
		super().save_model(request, obj, form, change)
