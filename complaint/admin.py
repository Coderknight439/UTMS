from django.contrib import admin
from django.utils.text import slugify
from .models import Complaint


@admin.register(Complaint)
class ComplaintAdmin(admin.ModelAdmin):
	exclude = ['complaint_by', 'status', 'complaint_date', 'accepted_by']
	list_display = ('complaint_by', 'bus_number', 'complaint_date', 'incident_date', 'complaint_type', 'status', 'description', 'feedback',)
	list_filter = ('complaint_type', 'complaint_date', 'incident_date', 'bus_number')
	list_editable = ('status',)
	search_fields = ['bus_number']
	ordering = ['complaint_date']

	def get_readonly_fields(self, request, obj=None):
		if request.user.is_staff:
			return ['complaint_by', 'bus_number', 'complaint_date', 'incident_date', 'complaint_type', 'description']

	def save_model(self, request, obj, form, change):
		status = obj.get_status_display()
		if status != 'Pending':
			obj.accepted_by = str(request.user)
		super().save_model(request, obj, form, change)
