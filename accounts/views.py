from _datetime import datetime
from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, 'accounts/index.html', {'title': 'UTMS', 'year': datetime.now().year,} )