from django.urls import path
from .views import *

urlpatterns = [
	path(r'', index, name='complaint_index'),
	path(r'add/', add, name='complaint_add'),
	path(r'<int:complaint_id>/edit/', edit, name='complaint_edit'),
]