"""
URL configuration for config project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# config/urls.py 
from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
from polls import views

urlpatterns = [
    path("", TemplateView.as_view(template_name="home.html"), name="home"),
    path('admin/', admin.site.urls),
    # path('polls/welcome', views.welcome_poll, name="welcome"),
    path("polls/", include('polls.urls')),
]
# path('polls/welcome', views.welcome_poll, name="welcome"),
# 사용자가 http://127.0.0.1:8000/polls/welcome 요청하면
# views.welcome_poll 함수를 호출해서 실행.

# path("polls/", include('polls.urls')),
# 사용자가 http://127.0.0.1:8000/polls/ 로 시작하는 url로 요청하면
# polls 앱의 urls.py 모듈에 가서 url-mapping을 확인해라.