from django import forms
from .models import TicketSale


class TicketForm(forms.ModelForm):
    class Meta:
        model = TicketSale
        fields = ['ticket_type', 'payment_type']
