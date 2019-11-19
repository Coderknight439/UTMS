from django.urls import path, re_path
from .views import *

urlpatterns = [
    path(r'', index, name='user_login'),
    path(r'logout/', user_logout, name='user_logout'),
    path(r'registration/', user_registration, name='registration'),
    path(r'profile/', profile, name='profile'),
    re_path(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        activate, name='activate'),
]
