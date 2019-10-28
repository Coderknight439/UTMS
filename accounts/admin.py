from django.contrib import admin
import datetime
from drivers.models import Driver, Staff
from .models import Student, Teacher
from .forms import StudentForm, TeacherForm
from django.utils.text import slugify
from departments.models import Department


@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    form = StudentForm
    exclude = ['created_by', 'updated_by', 'created_date', 'updated_date', 'student_id', 'email']
    list_display = ('student_id', 'first_name', 'last_name', 'department', 'is_active')
    list_filter = ('student_id', 'department', 'is_active')
    list_editable = ('first_name', 'last_name', 'is_active')
    fieldsets = (
        ('Personal Information', {
            'fields': ('first_name', 'last_name', 'phone_number', 'emergency_number', 'nid_number', 'birth_date', 'gender', 'height',
                       'weight', 'marital_status', 'religion', 'address_line_1', 'address_line_2' )
        }),
        ('Academic Information', {
            'fields': ('department', 'is_active')
        }),
    )
    empty_value_display = 'N/A'
    search_fields = ['student_id']
    actions = None

    def save_model(self, request, obj, form, change):
        obj.created_by = str(request.user)
        obj.updated_by = str(request.user)
        obj.slug = slugify(obj.student_id)
        year = str(datetime.datetime.now().year)[-2:]
        month = int(datetime.datetime.now().month)
        dep_count = 1
        for d in Department.objects.all():
            if obj.department == d:
                if (month >=1) and month <=4:
                    count = Student.objects.filter(student_id__icontains = year+'10'+str(dep_count)).count()
                    if obj.student_id == '':
                        if count>8:
                            obj.student_id = year+'10'+str(dep_count)+str(count+1)
                        else:
                            obj.student_id = year+'10'+str(dep_count)+'0'+str(count+1)
                elif (month >=5) and month <=8:
                    count = Student.objects.filter(student_id__icontains = year+'20'+str(dep_count)).count()
                    if obj.student_id == '':
                        if count>8:
                            obj.student_id = year+'20'+str(dep_count)+str(count+1)
                        else:
                            obj.student_id = year+'20'+str(dep_count)+'0'+str(count+1)
                else:
                    count = Student.objects.filter(student_id__icontains = year + '30' + str(dep_count)).count()
                    if obj.student_id == '':
                        if count > 8:
                            obj.student_id = year + '30' + str(dep_count) + str(count + 1)
                        else:
                            obj.student_id = year + '30' + str(dep_count) + '0' + str(count + 1)
                break
            dep_count += 1
        obj.email= obj.student_id+'@iubat.edu'
        obj.slug = slugify(obj.student_id)
        super().save_model(request, obj, form, change)

    class Media:
        js = ('js/admin/student_search.js',)


@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    form = TeacherForm
    exclude = ['created_by', 'updated_by', 'created_date', 'updated_date', 'employee_id']
    list_display = ('employee_id', 'first_name', 'last_name', 'designation', 'department', 'is_active')
    list_filter = ('designation', 'department', 'is_active')
    list_editable = ('first_name', 'last_name', 'designation', 'is_active')
    search_fields = ['employee_id']
    fieldsets = (
        ('Personal Information', {
            'fields': (
            'first_name', 'last_name', 'phone_number', 'emergency_number', 'nid_number', 'birth_date', 'gender',
            'height', 'weight', 'marital_status', 'religion', 'address_line_1', 'address_line_2')
        }),
        ('Current Organization Information', {
            'fields': ('department', 'designation', 'email', 'is_active')
        }),
        ('Experience', {
            'fields': ('previous_employment', 'experience')
        }),
    )
    actions = None

    def save_model(self, request, obj, form, change):
        obj.created_by = str(request.user)
        obj.updated_by = str(request.user)
        year = str(datetime.datetime.now().year)
        count = Teacher.objects.all().count()
        if obj.employee_id == 0:
            obj.employee_id = str(obj.department)[:3] + year[-2:] + str(count + 1)
        obj.slug = slugify(obj.employee_id)
        super().save_model(request, obj, form, change)

    class Media:
        js = ('js/admin/teacher_search.js',)


@admin.register(Driver)
class DriverAdmin(admin.ModelAdmin):
    exclude = ['created_by', 'updated_by', 'created_date', 'updated_date']
    list_display = ('employee_id', 'first_name', 'last_name', 'phone_number', 'emergency_number', 'is_active')
    list_filter = ('first_name', 'last_name', 'is_active')
    list_editable = ('first_name', 'last_name', 'phone_number', 'emergency_number', 'is_active')
    actions = None

    def save_model(self, request, obj, form, change):
        obj.created_by = str(request.user)
        obj.updated_by = str(request.user)
        year = str(datetime.datetime.now().year)
        count = Driver.objects.all().count()
        if obj.employee_id == 0:
            obj.employee_id = 'D-' + year[-2:] + str(count + 1)
        obj.slug = slugify(obj.employee_id)
        super().save_model(request, obj, form, change)

    class Media:
        js = ('js/admin/teacher_search.js',)


@admin.register(Staff)
class StaffAdmin(admin.ModelAdmin):
    exclude = ['created_by', 'updated_by', 'created_date', 'updated_date']
    list_display = ('employee_id', 'first_name', 'last_name', 'phone_number', 'emergency_number', 'is_active')
    list_filter = ('first_name', 'last_name', 'is_active')
    list_editable = ('first_name', 'last_name', 'phone_number', 'emergency_number', 'is_active')
    actions = None

    def save_model(self, request, obj, form, change):
        obj.created_by = str(request.user)
        obj.updated_by = str(request.user)
        year = str(datetime.datetime.now().year)
        count = Staff.objects.all().count()
        if obj.employee_id == 0:
            obj.employee_id = 'S-' + year[-2:] + str(count + 1)
        obj.slug = slugify(obj.employee_id)
        super().save_model(request, obj, form, change)

    class Media:
        js = ('js/admin/teacher_search.js',)
