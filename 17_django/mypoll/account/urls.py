# account/urls.py

from django.urls import path
from django.views.generic import TemplateView
from . import views

app_name = "account"

urlpatterns = [
    path("create", views.create, name="create"), # http://ip:port/account/create
    path("login", views.user_login, name="login"),
    path("logout", views.user_logout, name="logout"),
    path("detail", TemplateView.as_view(template_name="account/detail.html"), name="detail"),

]