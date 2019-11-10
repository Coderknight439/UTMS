from django import forms
from .models import Complaint


class ComplaintForm(forms.ModelForm):
	class Meta:
		model = Complaint
		exclude = ['complaint_by', 'accepted_by', 'status']
		widgets = {
			'incident_date': forms.DateInput(attrs={'type': 'date'})
		}
