# polls/urls.py - polls app의 url-mapping을 설정
## url - view

from django.urls import path
from . import views

urlpatterns = [
    path("welcome", views.welcome_poll, name="welcome"),
]