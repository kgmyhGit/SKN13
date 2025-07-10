# account/urls.py

from django.urls import path
from . import views

app_name = "account"

urlpatterns = [
    path("create", views.create, name="create"), # http://ip:port/account/create

]