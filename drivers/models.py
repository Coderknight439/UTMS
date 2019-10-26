import datetime
from django.db.models import *
from accounts.models import Passenger
from django.utils.text import slugify


# from choices import identity_mark_list


class Driver(Passenger):
    employee_id = CharField(max_length=50, unique=True, verbose_name='Employee ID')
    joining_date = DateField(default=datetime.date.today)
    resign_date = DateField(blank=True)

    # identity_mark = CharField(choices = identity_mark_list, max_length = 200, blank = True)

    def __str__(self):
        return "{} {}".format(self.first_name, self.last_name)
