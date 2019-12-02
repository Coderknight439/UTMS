from django.contrib import admin
from .models import RouteInfo
from stoppage.models import Stoppage, RouteStoppage
from django.utils.text import slugify



class RouteStoppageInline(admin.TabularInline):
    model = RouteStoppage
    extra = 1
    can_delete = True

@admin.register(RouteInfo)
class RouteAdmin(admin.ModelAdmin):
    exclude = ('created_by', 'updated_by', 'created_date', 'updated_date')
    list_display = ('route_number', 'display_text', 'start_stoppage', 'destination')
    list_editable = ('display_text', 'start_stoppage', 'destination')
    actions = None
    ordering = ['id']
    search_fields = ['start_stoppage']
    inlines = [RouteStoppageInline]

    def save_model(self, request, obj, form, change):
        obj.created_by = str(request.user)
        obj.updated_by = str(request.user)
        obj.slug = slugify(obj.route_number)
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit = False)
        # import pdb;pdb.set_trace()
        for instance in instances:
            instance.save()
        formset.save_m2m()

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
