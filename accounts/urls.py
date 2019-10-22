from django.urls import path
from .views import *

urlpatterns = [
    path(r'', index, name='login'),
    path(r'', user_logout, name='user_logout'),
    path(r'registration/', user_registration, name='registration'),
]
