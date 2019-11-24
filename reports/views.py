from django.db.models import Sum, F

from render import Render
from django.contrib import messages
from django.views.generic import View
from UTMS.settings import client
from ticketing.models import TicketSale


class VendorWisePurchaseReport(View):
	def get(self, request, **kwargs):
		pass


class VehicleWisePurchaseReport(View):
	def get(self, request, **kwargs):
		pass


class PassengerWiseTicketDetails(View):
	def get(self, request, **kwargs):
		from_date = request.GET.get('from_date')
		to_date = request.GET.get('to_date')
		query = TicketSale.objects.filter(payment_date__range=(from_date, to_date)).values('issued_for').annotate(
			total_amount=Sum('total_amount'),
			paid_amount=Sum('paid_amount'),
			due=F('total_amount') - F('paid_amount')
		)

		return Render.render('pdf/passenger_wise_ticket_details.html', {'query':query})


class MajorRouteForecast(View):
	def get(self, request, **kwargs):
		pass


class VehicleWiseComplaintAnalysisReport(View):
	def get(self, request, **kwargs):
		pass


class MonthlyComplaintReport(View):
	def get(self, request, **kwargs):
		pass


