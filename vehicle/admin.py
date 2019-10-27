from django.contrib import admin
from .models import VehicleInfo


@admin.register(VehicleInfo)
class VehicleAdmin(admin.ModelAdmin):
	list_display = ['vehicle_number', 'vehicle_type', 'route', 'driver', 'status']
	list_editable = ['route', 'driver', 'status']
	list_filter = ['route', 'vehicle_type', 'status']

