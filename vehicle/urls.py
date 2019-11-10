from django.urls import path
from .views import *

urlpatterns = [
	path(r'', index, name='vehicle_index'),
	path(r'<str:vehicle_number>/view/', view, name='vehicle_view')
]
