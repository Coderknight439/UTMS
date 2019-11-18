import datetime

from django.core.exceptions import ObjectDoesNotExist
from django.views.generic import View
from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone
from render import Render
from .forms import TicketForm
from .models import TicketSale, TicketInfo


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
        if form.is_valid():
            ticket_type = request.POST['ticket_type']
            payment_type = request.POST['payment_type']
            expiry_date = datetime.date.today() + datetime.timedelta(days=ticket_type)
            unit_price = TicketInfo.objects.get(ticket_type=ticket_type).unit_price
            discount = TicketInfo.objects.get(ticket_type=ticket_type).discount
            try:
                ticket_number = 'T-'+str(int(TicketSale.objects.last().ticket_number[2:])+1)
            except ObjectDoesNotExist:
                ticket_number = 'T-101'
            if discount != 0:
                total = unit_price*ticket_type - ((unit_price*ticket_type)*(discount/100))
            else:
                total = unit_price*ticket_type
            query = TicketSale.objects.create(
                ticket_type=ticket_type,
                payment_type=payment_type,
                issued_for=request.user,
                applied_date=datetime.datetime.now(),
                expiry_date=expiry_date,
                issued_by='',
                total_amount=total,
                ticket_number=ticket_number,
                voucher_number=''
            )
            query.save()
        if request.POST.get('submit', False):
            return redirect('ticket_index')
        else:
            form = TicketForm
            return render(request, 'ticketing/add.html', {'form': form, 'title': 'Buy Ticket'})
    form = TicketForm()
    return render(request, 'ticketing/add.html', {'form': form, 'title': 'Buy Ticket'})


def index(request, **kwargs):
    tickets = TicketSale.objects.filter(issued_for=request.user)
    return render(request, 'ticketing/index.html', {'tickets': tickets})
