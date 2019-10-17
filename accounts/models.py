from datetime import datetime
from django.db import models
from choices import gender_list, religion_list, marital_status_list, designation_list
from departments.models import Department

# Create your models here.
class Passenger(models.Model):
    first_name = models.CharField(max_length=200, verbose_name='First Name')
    last_name = models.CharField(max_length=200, verbose_name='Last Name')
    phone_number = models.CharField(max_length=200, verbose_name='Contact No.')
    emergency_number = models.CharField(max_length=200, verbose_name='Emergency Contact No.')
    birth_date = models.DateTimeField()
    nid_number = models.CharField(max_length=200, blank=True, default='')
    gender = models.CharField(choices=gender_list, max_length=200, default='')
    religion = models.CharField(choices=religion_list, max_length=200, default='')
    marital_status = models.CharField(choices=marital_status_list, max_length=200, default='', blank=True, )
    email = models.EmailField(unique=True)
    address_line_1 = models.CharField(max_length=200)
    address_line_2 = models.CharField(max_length=200, blank=True, default='')
    created_by = models.CharField(max_length=200, blank=True, default='')
    created_date = models.DateTimeField(max_length=200, blank=True, default=datetime.now())
    updated_by = models.CharField(max_length=200, blank=True, default='')
    updated_date = models.DateTimeField(max_length=200, blank=True, default=datetime.now())

    class Meta():
        abstract = True


class Student(Passenger):
    student_id = models.CharField(unique=True, max_length=200)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)

class Teacher(Passenger):
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    designation = models.CharField(choices=designation_list, max_length=200)



