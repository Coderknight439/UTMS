from django.contrib.auth.models import User
from django.db import models
from choices import ticket_types, ticket_status


class TicketSale(models.Model):
    ticket_type = models.CharField(max_length=200, choices=ticket_types, verbose_name='Type', default=ticket_types[0][0])
    issued_for = models.ForeignKey(User, on_delete=models.CASCADE)
    status = models.CharField(max_length=200, choices=ticket_status, verbose_name='Status')
    applied_date = models.DateField(auto_now_add=True)
    issued_date = models.DateField(blank=True, null=True)
    expiry_date = models.DateField(blank=True, null=True)
    issued_by = models.CharField(blank=True, default='')
    total_amount = models.DecimalField(max_length=10, decimal_places=2, verbose_name='Total')
    paid_amount = models.DecimalField(max_length=10, max_digits=2, verbose_name='Paid Amount', blank=True)


class TicketInfo(models.Model):
    unit_price = models.DecimalField(max_length=10, max_digits=2, verbose_name='Unit Price')
    discount = models.IntegerField(default=0)
    discount_purpose = models.TextField(max_length=500, verbose_name='Purpose')
    start_date = models.DateField(blank=True, null=True)
    Validate_for = models.IntegerField(verbose_name='Validate For')
    created_by = models.CharField(max_length=200)
    created_date = models.DateField(auto_now_add=True)
    updated_by = models.CharField(max_length=200)
    updated_date = models.DateField(auto_now=True)

