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
    path("password_change", views.password_change, name="password_change"),
    path("update", views.user_update, name="update"),
    path('delete', views.user_delete, name="delete"),

]