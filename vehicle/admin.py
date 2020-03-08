from django.contrib import admin
from django.contrib import messages
from django.core.exceptions import ObjectDoesNotExist

from .models import VehicleInfo
from drivers.models import Driver, Staff


@admin.register(VehicleInfo)
class VehicleAdmin(admin.ModelAdmin):
    exclude = ['vehicle_number', 'is_scheduled']
    list_display = ['vehicle_number', 'vehicle_type', 'route', 'driver', 'status']
    list_editable = ['route', 'status']
    list_filter = ['route', 'vehicle_type', 'status']
    ordering = ['vehicle_number']
    search_fields = ['vehicle_number']

    class Media:
        js = ('js/admin/vehicle_search.js',)

    def save_model(self, request, obj, form, change):
        try:
            vehicle = VehicleInfo.objects.all().last()
            vehicle_no = vehicle.vehicle_number[4:]
        except:
            vehicle_no = '100'
        import pdb;
        vehicle_type = obj.get_vehicle_type_display()[:3]
        try:
            driver = Driver.objects.get(id=obj.driver.id)
            staff = Staff.objects.get(id=obj.staff.id)
        except ObjectDoesNotExist:
            driver = None
            staff = None
            messages.success(request, 'Error!')
        if driver:
            driver.is_free = 'False'
            driver.save()
        if staff:
            staff.is_free = 'False'
            staff.save()
        if obj.vehicle_number == "":
            obj.vehicle_number = vehicle_type +'-'+str(int(vehicle_no)+1)
        super().save_model(request, obj, form, change)

