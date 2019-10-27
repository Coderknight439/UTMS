from django.contrib import admin
from .models import RouteStoppage


@admin.register(RouteStoppage)
class RouteStoppageAdmin(admin.ModelAdmin):
	list_display = ['id', 'route', 'stoppage']
	list_editable = ['route', 'stoppage']
	list_filter = ['route', 'stoppage']
	ordering = ['id']
