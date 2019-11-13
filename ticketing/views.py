from django.views.generic import View
from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone
from render import Render
from .forms import TicketForm


class SaleInvoice(View):

    def get(self, request):
        params = {
            'today': timezone.now(),
            'sales': 'Sales',
            'request': request
        }
        return Render.render('pdf/sale_invoice.html', params)



def add(request, **kwargs):
    if request.method == 'POST':
        form = TicketForm(request.POST)