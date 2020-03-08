from django.db.models import Sum, F, Count, Q
import datetime

from complaint.models import Complaint
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
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else to_date.replace(day=1)
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
			row['vendor'] = Vendor.objects.get(pk=row['vendor']).name
		return Render.render('pdf/date_wise_purchase_report.html', {'query': query, 'university': client, 'from_date':from_date, 'to_date':to_date})


class VehicleWisePurchaseReport(View):
	def get(self, request, **kwargs):
		vehicle_id = request.GET['vehicle']
		total = 0
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
				total+=row['amount']
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
				total += row['amount']
		# import pdb; pdb.set_trace()
		return Render.render('pdf/vehicle_wise_purchase_report.html', {'query': query, 'university':client, 'total':total})


class PassengerWiseTicketDetails(View):
	def get(self, request, **kwargs):
		to_date = request.GET.get('to_date') if request.GET.get('to_date') else datetime.datetime.today().date()
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else to_date.replace(day = 1)
		query = TicketSale.objects.filter(applied_date__range=(from_date, to_date)).values('issued_for').annotate(
			total_amount=Sum('total_amount'),
			paid_amount=Sum('paid_amount'),
			due=F('total_amount') - F('paid_amount'),
		)
		# for row in query:
		# 	tickets = TicketSale.objects.filter(issued_for=row['issued_for'])
		# 	all_tickets = ''
		# 	i = 1
		# 	for t in tickets:
		# 		if i == len(tickets):
		# 			all_tickets = all_tickets + t.ticket_number
		# 		else:
		# 			all_tickets = all_tickets+t.ticket_number+','
		# 		i += 1
		# 	row['ticket_number'] = all_tickets

		return Render.render('pdf/passenger_wise_ticket_details.html', {'query': query, 'university': client, 'from_date':from_date, 'to_date':to_date})


class MajorRouteForecast(View):
	def get(self, request, **kwargs):
		to_date = request.GET.get('to_date') if request.GET.get('to_date') else datetime.datetime.today().date()
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else to_date.replace(day=1)
		data_list = []
		route_list = []
		tickets = TicketSale.objects.filter(applied_date__range=(from_date, to_date))
		if tickets:
			for row in tickets:
				route_list.append(row.vehicle_id.route_id)
			route_list = list(dict.fromkeys(route_list))
			for route in route_list:
				vehicle_list = []
				route_text = RouteInfo.objects.get(pk=route)
				vehicle_count=VehicleInfo.objects.filter(route=route).count()
				vehicle = VehicleInfo.objects.filter(route_id=route)
				for row in vehicle:
					vehicle_list.append(row.id)
				ticket_count = 0
				for row in vehicle_list:
					count = TicketSale.objects.filter(vehicle_id=row).count()
					ticket_count+=count
				data_dict = dict()
				data_dict['route'] = route_text
				data_dict['total_ticket'] = ticket_count
				data_dict['total_vehicle'] = vehicle_count
				data_list.append(data_dict)

		return Render.render('pdf/major_route_forecast.html', {'query': data_list, 'university': client})


class DateWiseComplaintAnalysisReport(View):
	def get(self, request, **kwargs):
		from_date = request.GET.get('from_date') if request.GET.get('from_date') else datetime.datetime.now() + datetime.timedelta(-30)
		to_date = request.GET.get('to_date') if request.GET.get('to_date') else datetime.datetime.today().date()
		complaint = Complaint.objects.values('complaint_date').annotate(
			satisfied=Count('pk', filter=Q(feedback__in=[0, 1, 2])),
			dissatisfied=Count('pk', filter=Q(feedback__in=[3, 4, 5])),
		).filter(complaint_date__range=(from_date, to_date))
		for row in complaint:
			row['total'] = row['satisfied']+row['dissatisfied']
			row['satisfied_percentage'] = str(round(((int(row['satisfied'])/int(row['total']))*100), 2))+"%"
			row['dissatisfied_percentage'] = str(round(((int(row['dissatisfied']) / int(row['total'])) * 100), 2)) + "%"

		return Render.render('pdf/daily_complaint_analysis.html', {'query': complaint, 'university': client})


class MonthlyComplaintReport(View):
	def get(self, request, **kwargs):
		pass


