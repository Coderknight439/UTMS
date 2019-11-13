from django.db import models
from choices import ticket_types

class TicketModels(models.Model):
    ticket_type = models.CharField(max_length=200, choices = ticket_types, verbose_name = 'Type', default = ticket_types[0][0])
