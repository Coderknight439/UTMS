from django.contrib import admin
from .models import VehicleInfo
from drivers.models import Driver, Staff


@admin.register(VehicleInfo)
class VehicleAdmin(admin.ModelAdmin):
	exclude = ['vehicle_number']
	list_display = ['vehicle_number', 'vehicle_type', 'route', 'driver', 'status']
	list_editable = ['route', 'driver', 'status']
	list_filter = ['route', 'vehicle_type', 'status']
	ordering = ['vehicle_number']
	search_fields = ['vehicle_number']

	class Media:
		js = ('js/admin/vehicle_search.js',)

	def save_model(self, request, obj, form, change):
		vehicle = VehicleInfo.objects.all().latest('vehicle_number')
		vehicle_no = vehicle.vehicle_number[-3:]
		vehicle_type = obj.get_vehicle_type_display()[:3]
		driver = Driver.objects.get(id=obj.driver)
		staff = Staff.objects.get(id=obj.staff)
		driver.is_free = 'False'
		driver.save()
		staff.is_free = 'False'
		staff.save()
		if obj.vehicle_number == "":
			obj.vehicle_number = vehicle_type +'-'+str(int(vehicle_no)+1)
		super().save_model(request, obj, form, change)

