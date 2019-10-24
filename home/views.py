from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Q
from django.shortcuts import render, redirect, get_object_or_404
from accounts.models import Student, Teacher


@login_required(login_url = '/')
def index(request, **kwargs):
    username = request.user
    try:
        teacher_username = Teacher.objects.get(email=username )
    except ObjectDoesNotExist:
        teacher_username = None
    try:
        student_username = Student.objects.filter(Q(student_id=username) | Q (email=username ))
    except ObjectDoesNotExist:
        student_username = None
    if teacher_username is not None:
        user_name = teacher_username[0]
        return render(request, 'base.html', {'title': 'UTMS Home', 'username': user_name})
    else:
        user_name = student_username[0]
        return render ( request , 'base.html' , {'title': 'UTMS Home' , 'username': user_name})