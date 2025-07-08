# polls/urls.py - polls app의 url-mapping을 설정
## url - view

from django.urls import path
from . import views

urlpatterns = [
    path("welcome", views.welcome_poll, name="welcome"),
    path("list", views.list, name="list"),
    path("vote_form/<int:question_id>", views.vote_form, name="vote_form"),
    path("vote", views.vote, name="vote"),
]
# python manage.py runserver
# http://127.0.0.1:8000/polls/list -> views.list() -> list.html -> User
# http://127.0.0.1:8000/polls/vote_form/질문ID -> path parameter 설정
# http://127.0.0.1:8000/polls/vote -> 투표처리
### <타입:받을view의파라미터이름>



