from django.urls import path
from .views import *

urlpatterns = [
	path(r'', index, name='complaint_index'),
	path(r'add/', add, name='complaint_add'),
]