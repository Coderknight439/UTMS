from django.contrib.auth.models import User
from django.db import models
from choices import ticket_types, ticket_status, payment_types


class TicketSale(models.Model):
    ticket_type = models.CharField(max_length=200, choices=ticket_types, verbose_name='Type', default=ticket_types[0][0])
    issued_for = models.CharField(max_length = 200)
    status = models.CharField(max_length=200, choices=ticket_status, verbose_name='Status', default=ticket_status[0][0])
    applied_date = models.DateField(auto_now_add=True)
    expiry_date = models.DateField(blank=True, null=True)
    issued_by = models.CharField(blank=True, null=True, default='', max_length=200)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Total')
    paid_amount = models.DecimalField(decimal_places=2, max_digits=4, verbose_name='Paid Amount', blank=True, null=True, default=0)
    payment_type = models.CharField(max_length=200, choices=payment_types)
    payment_date = models.DateField(blank=True, null=True, verbose_name='Payment Date')
    ticket_number = models.CharField(max_length=300, verbose_name='Ticket No.')
    voucher_number = models.CharField(max_length=300)

    class Meta:
        db_table = 'sale_invoice'

    @property
    def due(self):
        return self.total_amount - self.paid_amount

    @property
    def unit_price(self):
        return TicketInfo.objects.get(ticket_type = self.ticket_type).unit_price


class TicketInfo(models.Model):
    ticket_type = models.CharField(max_length=200, choices=ticket_types, verbose_name='Type',
                                   default=ticket_types[0][0])
    unit_price = models.DecimalField(decimal_places=2, max_digits=4, verbose_name='Unit Price')
    discount = models.IntegerField(default=0, blank = True)
    discount_purpose = models.TextField(max_length=500, verbose_name='Purpose', blank=True)
    start_date = models.DateField(blank=True, null=True)
    Validate_for = models.IntegerField(verbose_name='Validate For', blank = True, default = 0)
    created_by = models.CharField(max_length=200)
    created_date = models.DateField(auto_now_add=True)
    updated_by = models.CharField(max_length=200)
    updated_date = models.DateField(auto_now=True)

    class Meta:
        db_table = 'ticket_info'

