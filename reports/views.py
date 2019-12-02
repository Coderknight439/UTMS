from django.db.models import Sum, F, Count
import datetime
from render import Render
from django.views.generic import View
from UTMS.settings import client
from route.models import RouteInfo
from ticketing.models import TicketSale
from purchase_order.models import PurchaseInvoice, PurchaseProduct
from vehicle.models import VehicleInfo
from vendor.models import Vendor


class DateWisePurchaseReport(View):
	def get(self, request, **kwargs):
		to_date = request.GET.get('to_date') if request.GET.get('to_date') else datetime.datetime.today().date()
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else to_date.replace(day = 1)
		query = PurchaseInvoice.objects.filter(entry_date__range=(from_date, to_date)).values('entry_date').annotate(
			amount=Sum('amount'),
			vendor=F('vendor_id'),
			purchase_id=F('id')
		)
		for row in query:
			products = PurchaseProduct.objects.filter(purchase_id=row['purchase_id'])
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
		vehicle_id = request.GET['vehicle']
		# import pdb; pdb.set_trace()
		if vehicle_id:
			query = PurchaseInvoice.objects.filter(vehicle_id_id = int(vehicle_id)).values('entry_date').annotate(
				amount = Sum('amount'),
				vendor = F('vendor_id'),
				purchase_id = F('purchase_id'),
			)
			for row in query:
				row['vehicle'] = VehicleInfo.objects.get(pk = vehicle_id).vehicle_number
				row['vendor'] = Vendor.objects.get(pk = row['vendor']).name
		else:
			query = PurchaseInvoice.objects.values('entry_date').annotate(
				amount = Sum('amount'),
				vendor = F('vendor_id'),
				vehicle = F('vehicle_id'),
				purchase_id = F('purchase_id')
			)
			for row in query:
				row['vehicle'] = VehicleInfo.objects.get(pk = row['vehicle']).vehicle_number
				row['vendor'] = Vendor.objects.get(pk = row['vendor']).name
		# import pdb; pdb.set_trace()
		return Render.render('pdf/vehicle_wise_purchase_report.html', {'query': query, 'university':client})



class PassengerWiseTicketDetails(View):
	def get(self, request, **kwargs):
		to_date = request.GET.get('to_date') if request.GET.get('to_date') else datetime.datetime.today().date()
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else to_date.replace(day = 1)
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

		return Render.render('pdf/passenger_wise_ticket_details.html', {'query': query, 'university':client})


class MajorRouteForecast(View):
	def get(self, request, **kwargs):
		to_date = request.GET.get('to_date') if request.GET.get('to_date') else datetime.datetime.today().date()
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else to_date.replace(day = 1)
		query = TicketSale.objects.filter(applied_date__range = (from_date, to_date)).values('vehicle_id__route').annotate(
			total_ticket = Count('id'),
			total_vehicle = Count('vehicle_id')
		)
		for row in query:
			row['vehicle_id__route'] = RouteInfo.objects.get(pk = row['vehicle_id__route']).display_text

		return Render.render('pdf/major_route_forecast.html', {'query': query, 'university': client})

class VehicleWiseComplaintAnalysisReport(View):
	def get(self, request, **kwargs):
		pass


class MonthlyComplaintReport(View):
	def get(self, request, **kwargs):
		pass


