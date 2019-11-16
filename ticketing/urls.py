from django.urls import path

from .views import *

urlpatterns = [
    path(r'print/', SaleInvoice.as_view()),
    path(r'add/', add, name='ticket_add')
]