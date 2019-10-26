from django.contrib import admin

from drivers.models import Driver
from .models import Student, Teacher
from .forms import StudentForm, TeacherForm
from django.utils.text import slugify


@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
	form = StudentForm
	exclude = ['marital_status', 'created_by', 'updated_by', 'created_date', 'updated_date', 'nid']
	list_display = ('student_id', 'first_name', 'last_name', 'department')
	list_filter = ('student_id', 'department')
	list_editable = ('first_name', 'last_name')
	actions = None

	def save_model(self, request, obj, form, change):
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.slug = slugify(obj.student_id)
		super().save_model(request, obj, form, change)


@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
	form = TeacherForm
	exclude = ['created_by', 'updated_by', 'created_date', 'updated_date']
	list_display = ('employee_id', 'first_name', 'last_name', 'designation', 'department')
	list_filter = ('designation', 'department')
	list_editable = ('first_name', 'last_name', 'designation')
	actions = None

	def save_model(self, request, obj, form, change):
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.slug = slugify(obj.employee_id)
		super().save_model(request, obj, form, change)


@admin.register(Driver)
class DriverAdmin(admin.ModelAdmin):
	exclude = ['created_by', 'updated_by', 'created_date', 'updated_date', 'resign_date', 'joining_date']
	list_display = ('employee_id', 'first_name', 'last_name', 'joining_date')
	list_filter = ('first_name', 'last_name')
	list_editable = ('first_name', 'last_name')
	actions = None

	def save_model(self, request, obj, form, change):
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.slug = slugify(obj.employee_id)
		super().save_model(request, obj, form, change)
