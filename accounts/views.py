from _datetime import datetime
from django.core.exceptions import ObjectDoesNotExist
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from .models import Student, Teacher
from django.db.models import Q


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
                return redirect('/home/')
            elif user.is_superuser:
                return redirect('/admin/')
            else:
                return render(request, 'accounts/index.html', {'title': 'UTMS', 'year': datetime.now().year}, context)

    return render(request, 'accounts/index.html', {'title': 'UTMS', 'year': datetime.now().year})


def user_logout(request):
    logout(request)
    return redirect('/')



def user_registration(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        try:
            teacher_username = Teacher.objects.get(email=username)
        except ObjectDoesNotExist:
            teacher_username = None
        try:
            student_username = Student.objects.filter(Q(student_id=username) | Q(email=username))
        except ObjectDoesNotExist:
            student_username = None
        context = {'error': 'You are not a registered student or faculty'}
        if teacher_username is not None:
            user = User.objects.create_user(username=username, password=password, email=username)
            user.save()
            group = Group.objects.get(name='Passenger')
            group.user_set.add(user)
            messages.success(request, 'Registration Done Successfully' )
            return redirect('/')
        elif student_username is not None:
            query = Student.objects.raw('Select s.id, s.email from accounts_student s where s.student_id = %s '
                                                'OR s.email = %s', [username, username])
            for student in query:
                student_email = student.email
            user = User.objects.create_user(username=username, password=password, email=student_email)
            user.save()
            group = Group.objects.get(name='Passenger')
            group.user_set.add(user)
            messages.success(request , 'Registration Done Successfully')
            return redirect('/')
        else:
            return render(request , 'accounts/registration.html' , {'title': 'UTMS Registration'}, context)
    return render(request,'accounts/registration.html', {'title': 'UTMS Registration'})
