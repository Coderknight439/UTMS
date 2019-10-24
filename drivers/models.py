import datetime
from django.db.models import *
from accounts.models import Passenger
# from choices import identity_mark_list


class Driver(Passenger):
    joining_date = DateField(default = datetime.date)
    resign_date = DateField(default = datetime.date)
    # identity_mark = CharField(choices = identity_mark_list, max_length = 200, blank = True)

    def __str__(self):
        return "{} {}".format(self.first_name, self.last_name)
