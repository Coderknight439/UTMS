from django import forms


class StudentForm(forms.ModelForm):
	class Meta:
		exclude = ['marital_status']
		widgets = {'email': forms.EmailInput(attrs={'placeholder': 'University Email'})}


class TeacherForm(forms.ModelForm):
	class Meta:
		exclude = ['marital_status']
		widgets = {'email': forms.EmailInput(attrs={'placeholder': 'University Email'})}
