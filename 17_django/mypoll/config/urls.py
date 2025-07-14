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
    path("account/", include("account.urls")),
]
from django.conf.urls.static import static
from . import settings
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# 파일 업로드관련 설정. "MEDIA_URL" 로 요청이 들어오면 
#     어느 경로(MEDIA_ROOT)의 파일들을 제공할 것인지 설정.
# Django 개발서버에서 필요한 설정.
# 운영시 웹서버(HTTP서버) 와 django 실행 환경(wsgi)을 분리해서 운영환경을 정의 할 경우
# 웹 서버에게 MEDIA_ROOT 경로를 설정하는 것으도 대신한다.


# path('polls/welcome', views.welcome_poll, name="welcome"),
# 사용자가 http://127.0.0.1:8000/polls/welcome 요청하면
# views.welcome_poll 함수를 호출해서 실행.

# path("polls/", include('polls.urls')),
# 사용자가 http://127.0.0.1:8000/polls/ 로 시작하는 url로 요청하면
# polls 앱의 urls.py 모듈에 가서 url-mapping을 확인해라.