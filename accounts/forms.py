from django import forms
from suit.widgets import EnclosedInput

from accounts.utils import FeetAndInchesField


class StudentForm(forms.ModelForm):
	class Meta:
		exclude = ['marital_status']
		widgets = {
			'email': forms.EmailInput(attrs={'placeholder': 'University Email'}),
			'height': EnclosedInput(append='ft'),
			'weight': EnclosedInput(append='kg')
		}
	height = FeetAndInchesField()


class TeacherForm(forms.ModelForm):
	height = FeetAndInchesField()

	class Meta:
		exclude = ['marital_status']
		widgets = {
			'email': forms.EmailInput(attrs={'placeholder': 'University Email'}),
			'weight': EnclosedInput(append='kg')
		}


class DriverForm(forms.ModelForm):
	height = FeetAndInchesField()

	class Meta:
		exclude = ['marital_status']
		widgets = {
			'weight': EnclosedInput(append='kg')
		}


class StaffForm(forms.ModelForm):
	height = FeetAndInchesField()

	class Meta:
		exclude = ['marital_status']
		widgets = {
			'weight': EnclosedInput(append='kg')
		}
