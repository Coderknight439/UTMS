from django.urls import path
from .views import *

urlpatterns = [
    path(r'', index, name='user_login'),
    path(r'logout/', user_logout, name='user_logout'),
    path(r'registration/', user_registration, name='registration'),
    path(r'profile/', profile, name='profile')
]
