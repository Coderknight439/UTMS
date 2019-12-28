import datetime
from django.db.models import Count
from django.contrib import messages
from django.http import JsonResponse
from UTMS.settings import client
from django.core.exceptions import ObjectDoesNotExist
from django.views.generic import View
from django.shortcuts import render, redirect, get_object_or_404
from django.core import serializers
from render import Render
from .forms import TicketForm
from .models import TicketSale, TicketInfo


class SaleInvoice(View):

    def get(self, request, ticket_number):
        tickets = TicketSale.objects.get(ticket_number = ticket_number)
        prev = tickets.ticket_number[2:]
        # import pdb; pdb.set_trace()
        tickets.invoice = 'PI-'+prev
        params = {
            'university': client,
            'tickets': tickets,
            'request': request
        }
        return Render.render('pdf/sale_invoice.html', params)


def add(request, **kwargs):
    # import pdb; pdb.set_trace()
    if request.method == 'POST':
        form = TicketForm(request.POST)
        if form.is_valid():
            ticket_type = request.POST['ticket_type']
            payment_type = request.POST['payment_type']
            unit_price = TicketInfo.objects.get(ticket_type=ticket_type).unit_price
            tick_num = TicketSale.objects.last()
            if tick_num:
                ticket_number = 'T-'+str(int(tick_num.ticket_number[2:])+1)
            else:
                ticket_number = 'T-101'
            # if discount != 0:
            #     total = float(unit_price)*int(ticket_type) - ((float(unit_price)*int(ticket_type))*(discount/100))
            # else:
            #     total = float(unit_price)*int(ticket_type)
            query = TicketSale.objects.create(
                ticket_type=ticket_type,
                payment_type=payment_type,
                issued_for=request.user.username,
                applied_date=datetime.datetime.now(),
                # expiry_date=expiry_date,
                issued_by='',
                total_amount=float(unit_price)*int(ticket_type),
                ticket_number=ticket_number,
                voucher_number=''
            )

            query.save()
        # import pdb;
        # pdb.set_trace()
        if request.POST.get('submit', False):
            messages.success(request, 'Thank you for using UTMS. You will be notified your status soon!')
            return redirect('ticket_index')
        else:
            form = TicketForm
            messages.success(request, 'Thank you for using UTMS. You will be notified your status soon!')
            return render(request, 'ticketing/add.html', {'form': form, 'title': 'Buy Ticket'})
    form = TicketForm()
    return render(request, 'ticketing/add.html', {'form': form, 'title': 'Buy Ticket'})


def index(request, **kwargs):
    tickets = TicketSale.objects.filter(issued_for=request.user.username)
    return render(request, 'ticketing/index.html', {'tickets': tickets})


def ticket_sale_data(request, **kwargs):
    from_date = (datetime.datetime.now() - datetime.timedelta(days=6)).date()
    to_date = datetime.datetime.today()
    data = TicketSale.objects.filter(applied_date__range=(from_date, to_date)).values('applied_date').annotate(
        tickets=Count('id')
    )
    return JsonResponse(list(data), safe=False)
