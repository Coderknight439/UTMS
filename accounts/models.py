from django.db import models
from accounts.utils import format_inches_to_feet_and_inches
from choices import gender_list, religion_list, marital_status_list, designation_list
from departments.models import Department


# Create your models here.
class Passenger(models.Model):
    first_name = models.CharField(max_length=200, verbose_name='First Name')
    last_name = models.CharField(max_length=200, verbose_name='Last Name')
    phone_number = models.CharField(max_length=200, verbose_name='Contact No.')
    emergency_number = models.CharField(max_length=200, blank=True, verbose_name='Emergency Contact No.')
    birth_date = models.DateField(verbose_name='Birth Date')
    nid_number = models.CharField(max_length=200, blank=True, default='', verbose_name='NID')
    gender = models.CharField(choices=gender_list, max_length=200, default='')
    religion = models.CharField(choices=religion_list, max_length=200, default='', verbose_name='Religion')
    marital_status = models.CharField(choices=marital_status_list, max_length=200, default=1, blank=True, verbose_name='Marital Status')
    email = models.EmailField(unique=True, blank=True)
    address_line_1 = models.CharField(max_length=200, verbose_name='Address-1')
    address_line_2 = models.CharField(max_length=200, blank=True, default='', verbose_name='Address-2')
    created_by = models.CharField(max_length=200, blank=True, verbose_name='Created By', default=None)
    updated_by = models.CharField(max_length=200, blank=True, verbose_name='Created By', default=None)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True, verbose_name='Active')
    photo = models.ImageField(upload_to='users/%Y/%m/%d/',
                              blank=True, null=True)

    class Meta:
        abstract = True


class Student(Passenger):
    student_id = models.CharField(unique=True, max_length=200, verbose_name='Student ID', default='', blank = True)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)

    def __str__(self):
        return "{}".format(self.student_id)

    class Meta:
        ordering = ['student_id']

    @property
    def height_in_feet_and_inches(self):
        return format_inches_to_feet_and_inches(self.qty)


class Teacher(Passenger):

    employee_id = models.CharField(max_length=50, verbose_name='Employee ID', unique=True, default=0)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    designation = models.CharField(choices=designation_list, max_length=200, verbose_name='Designation', default=0)
    previous_employment = models.CharField(max_length=200, verbose_name='Previous Organization', blank=True)
    experience = models.IntegerField(verbose_name='Experience', blank=True, default=0)

    def __str__(self):
        return "{} {}".format(self.first_name, self.last_name)

    class Meta:
        ordering = ['employee_id']
