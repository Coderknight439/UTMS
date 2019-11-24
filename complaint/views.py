from django.shortcuts import redirect, render, get_object_or_404
from .forms import ComplaintForm, ComplaintFeedbackForm
from django.contrib import messages
from .models import Complaint


def index(request):
	complaint = Complaint.objects.filter(complaint_by=request.user)[:3]
	return render(request, 'complaint/index.html', {'complaint': complaint, 'title': 'Complaint List'})


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
			return render(request, 'complaint/add.html', {'form': form, 'title': 'Complaint Add'})
	form = ComplaintForm
	return render(request, 'complaint/add.html', {'form': form, 'title': 'Complaint Add'})


def edit(request, complaint_id, **kwargs):
	complaint = get_object_or_404(Complaint, pk=complaint_id)
	if request.method == 'POST':
		form = ComplaintFeedbackForm(request.POST, instance=complaint)
		if form.is_valid():
			complaint = form.save()
			messages.success(request, "Your Feedback Updated Successfully. Thank you!")
			return redirect('home')
	else:
		form = ComplaintFeedbackForm(instance=complaint)
	# import pdb; pdb.set_trace()
	return render(request, 'search_forms/complaint_feedback.html', {'form': form})
