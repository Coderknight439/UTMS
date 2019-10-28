from decimal import Decimal
from math import floor
from django.core.exceptions import ValidationError
from django.forms.fields import MultiValueField, IntegerField, FloatField
from django import forms

INCH_DECIMALS = [str(float(i) / float(16)) for i in range(0, 16)]


def inches_to_feet_and_inches(value_in_inches):
	if value_in_inches:
		value_in_inches = float(value_in_inches)
		feet = int(round(value_in_inches, 0) / 12)
		inches = int(floor(value_in_inches) % 12)
		return feet, inches
	return 0, 0


def sum_feet_inches_fractional_inches(feet, inches):
	return Decimal(str(((float(feet) * 12) + float(inches))))


def format_inches_to_feet_and_inches(value_in_inches):
	feet, inches = inches_to_feet_and_inches(value_in_inches)
	if value_in_inches > 11.9375:
		value = "%s' %s" % (feet, inches)
	else:
		value = "%s" % inches

	return value + '"'


class FeetAndInchesWidget(forms.MultiWidget):
	"""
	A widget that splits foot / inch and fraction text input into a decimal value
	"""

	def __init__(self, attrs=None):
		self.attrs = attrs or {}
		widgets = (
			forms.TextInput(attrs={'size': '0', 'placeholder': 'Feet'}),
			forms.TextInput(attrs={'size': '0', 'placeholder': 'Inch'}),
		)
		super(FeetAndInchesWidget, self).__init__(widgets, attrs)

	def decompress(self, value):
		if value:
			feet, inches = inches_to_feet_and_inches(value)
			return [feet, inches]
		return []

	def format_output(self, rendered_widgets):
		return u'%s Feet&nbsp;&nbsp;%s&nbsp;%s Inches' % \
			   (rendered_widgets[0], rendered_widgets[1])


class FeetAndInchesField(MultiValueField):
	widget = FeetAndInchesWidget

	def __init__(self, *args, **kwargs):
		errors = self.default_error_messages.copy()
		if 'error_messages' in kwargs:
			errors.update(kwargs['error_messages'])
		localize = kwargs.get('localize', False)
		fields = (
			IntegerField(min_value=0, required=False, localize=localize),
			IntegerField(min_value=0, localize=localize),
		)
		super(FeetAndInchesField, self).__init__(fields, *args, **kwargs)

	def compress(self, data_list):
		if data_list:
			feet = data_list[0]
			inches = data_list[1]
			if feet == inches == 0:
				raise ValidationError(u'Please specify a value for feet or inches')
			return sum_feet_inches_fractional_inches(feet, inches)
		return None
