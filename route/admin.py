from django.contrib import admin
from .models import RouteInfo
from stoppage.models import Stoppage, RouteStoppage
from django.utils.text import slugify


@admin.register(RouteInfo)
class RouteAdmin(admin.ModelAdmin):
    exclude = ('created_by', 'updated_by', 'created_date', 'updated_date')
    list_display = ('route_number', 'display_text', 'start_stoppage', 'destination')
    list_editable = ('display_text', 'start_stoppage', 'destination')
    actions = None
    ordering = ['id']
    search_fields = ['start_stoppage']

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.updated_by = request.user
        obj.slug = slugify(obj.route_number)
        super().save_model(request, obj, form, change)

    class Media:
        js = ('js/admin/route_search.js',)


@admin.register(Stoppage)
class StoppageAdmin(admin.ModelAdmin):
    list_display = ('id', 'location')
    list_editable = ('location',)
    exclude = ('created_by', 'updated_by', 'created_date', 'updated_date')
    ordering = ['location']
    search_fields = ['location']

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.updated_by = request.user
        super().save_model(request, obj, form, change)

    class Media:
        js = ('js/admin/stoppage_search.js',)


@admin.register(RouteStoppage)
class RouteStoppageAdmin(admin.ModelAdmin):
    list_display = ['id', 'route_name', 'stoppage_name']
    list_editable = ['route_name', 'stoppage_name']
    list_filter = ['route_name', 'stoppage_name']
    ordering = ['id']
