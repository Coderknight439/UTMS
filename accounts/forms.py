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
	class Meta:
		exclude = ['marital_status']
		widgets = {'email': forms.EmailInput(attrs={'placeholder': 'University Email'})}
