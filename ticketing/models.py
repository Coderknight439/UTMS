from django.contrib.auth.models import User
from django.db import models
from django.db.models import Q

from choices import ticket_types, ticket_status, payment_types
from vehicle.models import VehicleInfo


def vehicles():
    vehicle_info = VehicleInfo.objects.filter(Q(is_scheduled=True) & Q(status__in=[0, 2]))
    return {'pk__in': vehicle_info}


class TicketSale(models.Model):
    ticket_type = models.CharField(max_length=200, choices=ticket_types, verbose_name='Type', default=ticket_types[0][0])
    vehicle_id = models.ForeignKey(VehicleInfo, on_delete=models.CASCADE, limit_choices_to=vehicles, null=True, blank=True)
    issued_for = models.CharField(max_length=200)
    status = models.CharField(max_length=200, choices=ticket_status, verbose_name='Status', default=ticket_status[0][0])
    applied_date = models.DateField(auto_now_add=False)
    expiry_date = models.DateField(blank=True, null=True)
    issued_by = models.CharField(blank=True, null=True, default='', max_length=200)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Total')
    paid_amount = models.DecimalField(decimal_places=4, max_digits=7, verbose_name='Paid Amount', blank=True, null=True, default=0)
    payment_type = models.CharField(max_length=200, choices=payment_types)
    payment_date = models.DateField(blank=True, null=True, verbose_name='Payment Date')
    ticket_number = models.CharField(max_length=300, verbose_name='Ticket No.')
    voucher_number = models.CharField(max_length=300)
    braintree_id = models.CharField(max_length=150, blank=True)

    class Meta:
        db_table = 'sale_invoice'

    @property
    def due(self):
        return self.total_amount - self.paid_amount

    @property
    def unit_price(self):
        return TicketInfo.objects.get(ticket_type=self.ticket_type).unit_price

    @property
    def discount(self):
        unit_price = self.unit_price
        actual_amount = int(self.ticket_type)*unit_price
        discount_amount = actual_amount-self.total_amount
        if discount_amount > 0:
            return discount_amount
        return None


class TicketInfo(models.Model):
    ticket_type = models.CharField(max_length=200, choices=ticket_types, verbose_name='Type',
                                   default=ticket_types[0][0])
    unit_price = models.DecimalField(decimal_places=2, max_digits=4, verbose_name='Unit Price')
    created_by = models.CharField(max_length=200)
    created_date = models.DateField(auto_now_add=True)
    updated_by = models.CharField(max_length=200)
    updated_date = models.DateField(auto_now=True)

    class Meta:
        db_table = 'ticket_info'


class TicketDiscount(models.Model):
    discount = models.IntegerField(default=0, blank=True)
    discount_purpose = models.TextField(max_length=500, verbose_name='Purpose', blank=True)
    start_date = models.DateField()
    end_date = models.DateField()
    # status = models.CharField(max_length=200, choices=discount_status, default=discount_status[0][0])

    class Meta:
        db_table = 'discounts'

