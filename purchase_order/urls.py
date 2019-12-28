from django.urls import path

from .views import *

urlpatterns = [

    path(r'api/purchase_data/', purchase_data, name='purchase_data')
]
