from django.conf.urls import url
from .views import index, user_logout, user_registration

urlpatterns = [
    url(r'', index, name='login'),
    url(r'', user_logout, name='logout'),
    url(r'registration', user_registration, name='registration')
]
