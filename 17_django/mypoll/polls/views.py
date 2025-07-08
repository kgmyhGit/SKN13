# polls/views.py - view들을 구현
# view: 하나의 사용자 요청을 처리하는 함수
# View 함수 정의
## 1. view 함수, 
## 2. urls.py에 설정(url-view함수 매핑), 
## 3. template(응답화면이 있는 경우)

from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime 
from .models import Question, Choice # 모델 클래스들 import

def welcome_poll_old(request):
    # view 함수 -> 1개 이상의 파라미터를 선언. (1개 필수-HttpRequest객체를 받는다.)
    now = datetime.now().strftime("%Y년 %m월 %d일 %H시 %M분 %S초") #실행시점의 일시
    res_html = f"""<!doctype html>
<html>
    <head>
        <title>Welcome Poll</title>
    </head>
    <body>
        <h1>설문조사 APP</h1>
        현재시간: {now}
    </body>
</html>
"""
    return HttpResponse(res_html)

def welcome_poll(request):
    now = datetime.now().strftime("%Y년 %m월 %d일 %H시 %M분 %S초")
    # template 을 이용해서 응답 페이지를 생성.
    response = render(
        request,              # HttpRequest
        "polls/welcome.html", # template파일의 경로(app_directory/templates 이후 경로)
        {"now": now, "name":"홍길동"} 
        # view가 template에 전달할 값들을 dictionary에 name-value 로 묶어서 전달.
        #    -> context value라고 한다.
    )
    # response: HttpResponse(polls/welcome.html 처리 내용)
    print("=============", type(response))
    return response
# http://127.0.0.1:8000/polls/welcome


##########################################
# 설문 질문 목록을 출력하는 View
#
# url: polls/list
# view함수: list
# template: polls(app)/templates/polls/list.html

def list(request):
    # DB에서 question들을 조회
    q_list = Question.objects.all().order_by("-pub_date")

    # render(): template을 실행 해서 그 결과로 HttpResponse를 반환하는 함수.
    return render(
        request,  # HttpRequest객체
        "polls/list.html", # Template 파일의 경로
        {"question_list" : q_list} 
        # template에게 전달할 값 -> context value: dictionary
    )

################################
# 개별 설문 페이지로 이동하는 View
#  - 설문 질문 id를 받아서 그 질문에 대해 보기를 선택할 수있는 페이지를 응답
#
# url: polls/vote_form/질문_id   ex) polls/vote_form/3
# view 함수: vote_form
# template: polls/vote_form.html

def vote_form(request, question_id):
    # question_id: path parameter로 넘어온 값을 받을 변수
    question = Question.objects.get(pk=question_id)

    # 응답 -> html
    return render(request, "polls/vote_form.html", {"question":question})

###################################
# 투표 처리
#  - choice_id 받아서 votes 을 1 증가 
#  - 응답: 정상처리 - 투표 결과를 응답. 질문 - 보기(choice_text, votes)
#          요청파라미터 검증 실패(아무것도 선택안하고 요청) - vote_form.html 이동(다시투표하도록)
#
# url: polls/vote
# view함수: vote
# 응답 : 정상 - vote_result.html, 
#        오류 - vote_form.html

# View 함수에서 요청파라미터 값들 조회
## GET:  request.GET - 요청파라미터가 dictionary에 담겨서 제공.
## POST: request.POST- 요청파라미터가 dictionary에 담겨서 제공.
def vote(request):
    # 1. 요청파라미터 조회
    # question_id = request.POST['question_id']  # 없으면 Exception
    question_id = request.POST.get('question_id')# 없으면 None
    choice_id = request.POST.get('choice')
    # 2. 요청파라미터 검증 -> choice가 선택되었는지 여부
    if choice_id: # 선택이 된 경우(정상처리)
        # votes를 1 증가
        choice = Choice.objects.get(pk=choice_id)
        choice.votes += 1
        choice.save()
        # 응답페이지이동 -> Question객체
        question = Question.objects.get(pk=question_id)
        return render(request, "polls/vote_result.html", {"question":question})
    
    else: # 선택 안된 경우(예외상황) -> vote_form.html 이동
        question = Question.objects.get(pk=question_id)
        return render(
            request, 
            "polls/vote_form.html", 
            {"question": question, "error_message":"보기를 선택하세요."}
        )