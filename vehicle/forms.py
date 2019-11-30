from django import forms
from .models import VehicleInfo


class VehicleForm(forms.Form):
	vehicle = forms.ModelChoiceField(queryset = VehicleInfo.objects.all(), empty_label = 'All', required = False)
