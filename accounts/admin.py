from django.contrib import admin
from .models import Student, Teacher
from .forms import StudentForm, TeacherForm


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
		super().save_model(request, obj, form, change)


@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
	form = TeacherForm
	exclude = ['created_by', 'updated_by', 'created_date', 'updated_date', 'nid']
	list_display = ('id', 'first_name', 'last_name', 'designation', 'department')
	list_filter = ('designation', 'department')
	list_editable = ('first_name', 'last_name', 'designation')
	actions = None

	def save_model(self, request, obj, form, change):
		obj.created_by = request.user
		obj.updated_by = request.user
		super().save_model(request, obj, form, change)
