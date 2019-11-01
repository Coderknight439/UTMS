from django.contrib import admin
from .models import TransportSchedule
from vehicle.models import VehicleInfo


@admin.register(TransportSchedule)
class TransportScheduleAdmin(admin.ModelAdmin):
	list_display = ['id', 'vehicle_route', 'start_time', 'et']
	list_editable = ['start_time']
	list_filter = ['start_time']
	ordering = ['start_time']
	search_fields = ['vehicle_route']

	class Media:
		js = ('js/admin/vehicle_search.js',)

	def save_model(self, request, obj, form, change):
		vehicle = VehicleInfo.objects.get(vehicle_number=obj.vehicle_route)
		vehicle.is_scheduled = True
		vehicle.save()
		super().save_model(request, obj, form, change)

