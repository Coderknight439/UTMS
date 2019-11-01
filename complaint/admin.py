from django.contrib import admin
from django.utils.text import slugify
from .models import Complaint


@admin.register(Complaint)
class ComplaintAdmin(admin.ModelAdmin):
	list_display = ('complaint_by', 'bus_number', 'complaint_date', 'incident_date', 'complaint_type', 'status')
	list_filter = ('complaint_type', 'complaint_date', 'incident_date')
	list_editable = ('status',)
	actions = None

	def save_model(self, request, obj, form, change):
		obj.complaint_by = request.user
		super().save_model(request, obj, form, change)