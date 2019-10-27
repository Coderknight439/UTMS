from django.contrib import admin
import datetime
from drivers.models import Driver, Staff
from .models import Student, Teacher
from .forms import StudentForm, TeacherForm
from django.utils.text import slugify


@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
	form = StudentForm
	exclude = ['marital_status', 'created_by', 'updated_by', 'created_date', 'updated_date', 'nid']
	list_display = ('student_id', 'first_name', 'last_name', 'department', 'is_active')
	list_filter = ('student_id', 'department', 'is_active')
	list_editable = ('first_name', 'last_name', 'is_active')
	empty_value_display = 'N/A'
	search_fields = ['student_id']
	actions = None

	def save_model(self, request, obj, form, change):
		obj.created_by = str(request.user)
		obj.updated_by = str(request.user)
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
