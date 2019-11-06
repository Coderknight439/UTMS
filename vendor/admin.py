from django.contrib import admin
from .models import Vendor


@admin.register(Vendor)
class VendorAdmin(admin.ModelAdmin):
	list_display = ['name', 'contact_person', 'contact_number', 'address_line_1', 'email']
	list_editable = ['contact_number', 'address_line_1', 'email']
	search_fields = ['name']
	ordering = ['id']
