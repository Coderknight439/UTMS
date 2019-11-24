from django.db.models import Sum, F
import datetime
from render import Render
from django.views.generic import View
from UTMS.settings import client
from ticketing.models import TicketSale
from purchase_order.models import PurchaseInvoice, PurchaseProduct


class DateWisePurchaseReport(View):
	def get(self, request, **kwargs):
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else datetime.datetime.today()
		to_date = request.GET.get('to_date') if request.GET.get('to_date') else from_date+datetime.timedelta(days=30)
		query = PurchaseInvoice.objects.filter(entry_date__range=(from_date, to_date)).values('entry_date').annotate(
			amount=Sum('amount'),
			vendor=F('vendor_id'),
			purchase_id=F('purchase_id')
		)
		for row in query:
			products = PurchaseProduct.objects.filter(purcchase_id=row['purchase_id'])
			all_products = ''
			i = 1
			for p in products:
				if i == len(products):
					all_products = all_products + p.product_name
				else:
					all_products = all_products + p.product_name + ','
				i += 1
			row['products'] = all_products
		return Render.render('pdf/date_wise_purchase_report.html', {'query': query, 'university': client})


class VehicleWisePurchaseReport(View):
	def get(self, request, **kwargs):
		pass


class PassengerWiseTicketDetails(View):
	def get(self, request, **kwargs):
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else datetime.datetime.today()
		to_date = request.GET.get('to_date')  if request.GET.get('to_date') else from_date+datetime.timedelta(days=30)
		query = TicketSale.objects.filter(payment_date__range=(from_date, to_date)).values('issued_for').annotate(
			total_amount=Sum('total_amount'),
			paid_amount=Sum('paid_amount'),
			due=F('total_amount') - F('paid_amount'),
		)
		for row in query:
			tickets = TicketSale.objects.filter(issued_for=row['issued_for'])
			all_tickets = ''
			i = 1
			for t in tickets:
				if i == len(tickets):
					all_tickets = all_tickets + t.ticket_number
				else:
					all_tickets = all_tickets+t.ticket_number+','
				i += 1
			row['ticket_number'] = all_tickets

		return Render.render('pdf/passenger_wise_ticket_details.html', {'query': query, 'university': client})


class MajorRouteForecast(View):
	def get(self, request, **kwargs):
		pass


class VehicleWiseComplaintAnalysisReport(View):
	def get(self, request, **kwargs):
		pass


class MonthlyComplaintReport(View):
	def get(self, request, **kwargs):
		pass


