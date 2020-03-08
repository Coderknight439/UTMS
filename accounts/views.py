from UTMS import settings
import datetime
from django.core.exceptions import ObjectDoesNotExist
from django.contrib import messages
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate

from UTMS.settings import client
from .models import Student, Teacher
from django.db.models import Q
from transport_schedule.models import TransportSchedule
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from tokens import account_activation_token
from django.core.mail import EmailMessage

from django.utils import timezone


# Create your views here.
def index(request):
    transport_schedule = TransportSchedule.objects.filter(start_time__gte=datetime.datetime.now().time())
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        try:
            passenger = User.objects.get(username=username)
        except ObjectDoesNotExist:
            passenger = None
        if passenger is not None:
            date = timezone.now()-passenger.date_joined
            if date.days > 365:
                passenger.delete()
                messages.error(request, 'You are not registered!')
                return redirect('/')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            if user.groups.filter(name='passenger'):
                return redirect('/home/')
            elif user.is_superuser or user.is_staff:
                return redirect('/admin/')
        else:
            messages.error(request, 'Provide Valid Credentials')
            return render(request, 'registration/login.html', {'title': 'UTMS', 'year': datetime.datetime.now().year, 'schedule': transport_schedule})
    return render(request, 'registration/login.html', {'title': 'UTMS', 'year': datetime.datetime.now().year, 'schedule': transport_schedule})


def user_logout(request):
    logout(request)
    return redirect('/')


def user_registration(request):
    if request.method == "POST":
        student_email = ''
        username = request.POST['username']
        password = request.POST['password']
        try:
            existing_user = User.objects.get(username=username, is_active=True)
        except ObjectDoesNotExist:
            existing_user = None
        if not existing_user:
            try:
                teacher_username = Teacher.objects.get(email=username)
            except ObjectDoesNotExist:
                teacher_username = None
            try:
                student_username = Student.objects.filter(Q(student_id=username) | Q(email=username))
            except ObjectDoesNotExist:
                student_username = None
            if teacher_username is not None:
                user = User.objects.create_user(username=username, password=password, email=username)
                user.is_active = False
                user.save()
                group = Group.objects.get(name='Passenger')
                group.user_set.add(user)
                current_site = get_current_site(request)
                mail_subject = 'Activate your blog account.'
                message = render_to_string('registration/acc_active_email.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                    'token': account_activation_token.make_token(user),
                })
                to_email = username
                email = EmailMessage(
                    mail_subject, message, from_email=settings.EMAIL_HOST_USER, to=[to_email]
                )
                email.send()
                return HttpResponse('Please confirm your email address to complete the registration')
            elif student_username is not None:
                try:
                    query = Student.objects.raw('Select s.id, s.email from accounts_student s where s.student_id = %s '
                                                        'OR s.email = %s', [username, username])
                    for student in query:
                        student_email = student.email
                except ObjectDoesNotExist:
                    student_email = None
                user = User.objects.create_user(username=username, password=password, email=student_email)
                user.is_active = False
                user.save()
                group = Group.objects.get(name='Passenger')
                group.user_set.add(user)
                current_site = get_current_site(request)
                mail_subject = 'Activate your blog account.'
                message = render_to_string('registration/acc_active_email.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                    'token': account_activation_token.make_token(user),
                })
                to_email = student_email
                email = EmailMessage(
                    mail_subject, message, from_email=settings.EMAIL_HOST_USER, to=[to_email]
                )
                email.send()
                return HttpResponse('Please confirm your email address to complete the registration')
            else:
                messages.info(request, 'You are not registered, Talk to admin please')
                return render(request, 'registration/registration.html', {'title': 'UTMS Registration'})
        else:
            messages.success(request, 'You are already Registered. Did you forget password?')
            return redirect('/')
    return render(request, 'registration/registration.html', {'title': 'UTMS Registration'})


def profile(request, **kwargs):
    username = request.user.username
    if '@' in username:
        profile = Teacher.objects.get(email=username)
    else:
        profile = Student.objects.get(student_id=username)
    return render(request, 'passenger/profile.html', {'title': 'My Profile', 'teacher': profile, 'client': client})


def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(request, 'Thank you for your email confirmation. Now you can login your account.')
        return redirect('/')
    else:
        return HttpResponse('Activation link is invalid!')


def test(request):
    return render(request, 'registration/acc_active_email.html')
