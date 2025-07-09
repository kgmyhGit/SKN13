# polls/urls.py - polls app의 url-mapping을 설정
## url - view

from django.urls import path
from . import views

app_name = "polls"
# url mapping 설정으로 호출할 때 사용할 접두어 설정.
## welcome 호출 -> polls:welcome

urlpatterns = [
    path("welcome", views.welcome_poll, name="welcome"),
    path("vote_list", views.list, name="list"),
    path("vote_form/<int:question_id>", views.vote_form, name="vote_form"),
    path("vote", views.vote, name="vote"),
    path("vote_result/<int:question_id>", views.vote_result, name="vote_result"),
    path("vote_create", views.vote_create, name="vote_create"),
    path("", views.list, name="polls_main"), # http://127.0.0.1:8000/polls/
]
# python manage.py runserver
# http://127.0.0.1:8000/polls/list -> views.list() -> list.html -> User
# http://127.0.0.1:8000/polls/vote_form/질문ID -> path parameter 설정
# http://127.0.0.1:8000/polls/vote -> 투표처리

# http://127.0.0.1:8000/polls/vote_result/1

# http://127.0.0.1:8000/polls/vote_create

### <타입:받을view의파라미터이름>



