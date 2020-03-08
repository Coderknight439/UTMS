from django.urls import path
from .views import *

urlpatterns = [
	path(r'date_wise_purchase_report/', DateWisePurchaseReport.as_view(), name='date_wise_purchase_report'),
	path(r'vehicle_wise_purchase_report/', VehicleWisePurchaseReport.as_view(), name='vehicle_wise_purchase_report'),
	path(r'passenger_wise_ticket_details/', PassengerWiseTicketDetails.as_view(), name='passenger_wise_ticket_details'),
	path(r'date_wise_complaint_analysis_report/', DateWiseComplaintAnalysisReport.as_view(), name='date_wise_complaint_analysis_report'),
	path(r'major_route_forecast/', MajorRouteForecast.as_view(), name='major_route_forecast')
]