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
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            if user.groups.filter(name='passenger'):
                return redirect('/home/')
            elif user.is_superuser:
                return redirect('/admin/')
        else:
            messages.error(request, 'Provide Valid Credentials')
            return render(request, 'accounts/index.html', {'title': 'UTMS', 'year': datetime.now().year})
    return render(request, 'accounts/index.html', {'title': 'UTMS', 'year': datetime.now().year})


def user_logout(request):
    logout(request)
    return redirect('/')


def user_registration(request):
    if request.method == "POST":
        student_email = ''
        username = request.POST['username']
        password = request.POST['password']
        # import pdb;
        # pdb.set_trace()
        existing_user = User.objects.get(username=username)
        if not existing_user:
            try:
                teacher_username = Teacher.objects.get(email=username)
            except ObjectDoesNotExist:
                teacher_username = Teacher.objects.none()
            try:
                student_username = Student.objects.filter(Q(student_id=username) | Q(email=username))
            except ObjectDoesNotExist:
                student_username = Student.objects.none()
            if teacher_username.count() > 0:
                user = User.objects.create_user(username=username, password=password, email=username)
                user.save()
                group = Group.objects.get(name='Passenger')
                group.user_set.add(user)
                messages.success(request, 'Registration Done Successfully' )
                return redirect('/')
            elif student_username.count() > 0:
                try:
                    query = Student.objects.raw('Select s.id, s.email from accounts_student s where s.student_id = %s '
                                                        'OR s.email = %s', [username, username])
                    for student in query:
                        student_email = student.email
                except ObjectDoesNotExist:
                    student_email = None
                user = User.objects.create_user(username=username, password=password, email=student_email)
                user.save()
                group = Group.objects.get(name='Passenger')
                group.user_set.add(user)
                messages.success(request, 'Registration Done Successfully')
                return redirect('/')
            else:
                messages.info(request, 'You are not registered, Talk to admin please')
                return render(request, 'accounts/registration.html', {'title': 'UTMS Registration'})
        else:
            messages.success(request, 'You are already Registered. Did you forget password?')
            return redirect('/')
    return render(request, 'accounts/registration.html', {'title': 'UTMS Registration'})
