from _datetime import datetime
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from .models import Student, Teacher


# Create your views here.
def index(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        context = {'error': 'Provide Valid Credentials'}
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            if user.groups.filter(name='passenger'):
                return redirect('/home')
            elif user.is_superuser:
                return redirect('/admin/')
            else:
                return render(request, 'accounts/index.html', {'title': 'UTMS', 'year': datetime.now().year}, context)

    return render(request, 'accounts/index.html', {'title': 'UTMS', 'year': datetime.now().year})


def user_logout(request):
    logout(request)
    return redirect('/accounts/')


def user_registration(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']


