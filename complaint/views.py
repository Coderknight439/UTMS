from django.shortcuts import redirect, render
from .forms import ComplaintForm

from .models import Complaint


def index(request):
	complaint = Complaint.objects.filter(complaint_by=request.user)[:3]
	return render(request, 'complaint/index.html', {'complaint': complaint})


def add(request, **kwargs):
	if request.method == 'POST':
		form = ComplaintForm(request.POST)
		if form.is_valid():
			complaint_type = request.POST['complaint_type']
			incident_date = request.POST['incident_date']
			vehicle_no = request.POST['bus_number']
			description = request.POST['description']
			complaint_by = str(request.user)
			accepted_by = ''
			query = Complaint.objects.create(
				complaint_type=complaint_type,
				incident_date=incident_date,
				bus_number_id=vehicle_no,
				description=description,
				complaint_by=complaint_by,
				accepted_by=accepted_by
			)
			query.save()
		if request.POST.get('submit', False):
			return redirect('complaint_index')
		else:
			form = ComplaintForm
			return render(request, 'complaint/add.html', {'form': form})
	form = ComplaintForm()
	return render(request, 'complaint/add.html', {'form': form})
