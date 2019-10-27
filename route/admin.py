from django.contrib import admin
from .models import RouteInfo
from stoppage.models import Stoppage
from django.utils.text import slugify


@admin.register(RouteInfo)
class RouteAdmin(admin.ModelAdmin):
    exclude = ('created_by', 'updated_by', 'created_date', 'updated_date')
    list_display = ('route_number', 'display_text', 'start_stoppage', 'destination')
    list_editable = ('display_text', 'start_stoppage', 'destination')
    actions = None

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.updated_by = request.user
        obj.slug = slugify(obj.route_number)
        super().save_model(request, obj, form, change)


@admin.register(Stoppage)
class StoppageAdmin(admin.ModelAdmin):
    list_display = ('route_id', 'location')
    list_editable = ('location',)
    exclude = ('created_by', 'updated_by', 'created_date', 'updated_date')

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.updated_by = request.user
        obj.slug = slugify(obj.route_id)
        super().save_model(request, obj, form, change)