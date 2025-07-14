from django.urls import path
from .views import  chat_message
from django.views.generic import TemplateView


urlpatterns = [
    path('chat_message/<str:message>/', chat_message, name='chat_message'),
]