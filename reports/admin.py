from django.contrib import admin
from .models import *


@admin.register(Reports)
class ReportAdmin(admin.ModelAdmin):
	list_display = ['name_link', 'url']
	ordering = ['id']

	def name_link(self, obj):
		# import pdb; pdb.set_trace()
		return format_html(u'<a data-toggle=modal data-target="#{}">{}</a>'.format(obj.get_url_display(), obj.name))
