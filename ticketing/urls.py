from django.urls import path

from .views import *

urlpatterns = [
    path(r'<str:ticket_number>/print/', SaleInvoice.as_view(), name='sale_invoice'),
    path(r'add/', add, name='ticket_add'),
    path(r'', index, name='ticket_index'),
    path(r'api/ticket_data/', ticket_sale_data, name='ticket_sale_data'),
    path(r'payment/', ticket_payment, name='ticket_payment'),
]