import datetime
from django.db.models import *
from accounts.models import Passenger
# from choices import identity_mark_list


class Driver(Passenger):
    employee_id = CharField(max_length=50, unique=True, verbose_name='Employee ID', default = 0)
    # joining_date = DateField(auto_now_add=)
    # resign_date = DateField()
    designation = CharField(max_length = 200, default='Driver', editable = False)

    # identity_mark = CharField(choices = identity_mark_list, max_length = 200, blank = True)

    def __str__(self):
        return "{} {}".format(self.first_name, self.last_name)

    class Meta:
        ordering = ['employee_id']


class Staff(Passenger):
    employee_id = CharField(max_length = 50, unique = True, verbose_name = 'Employee ID', default = 0)
    # joining_date = DateField(auto_now_add=True)
    # # resign_date = DateField(blank = True)
    designation = CharField(max_length = 200, default='Bus Staff', editable = False)

    def __str__(self):
        return "{} {}".format(self.first_name, self.last_name)

    class Meta:
        ordering = ['employee_id']
