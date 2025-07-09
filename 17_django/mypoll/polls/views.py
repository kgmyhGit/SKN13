# polls/views.py - view들을 구현
# view: 하나의 사용자 요청을 처리하는 함수
# View 함수 정의
## 1. view 함수, 
## 2. urls.py에 설정(url-view함수 매핑), 
## 3. template(응답화면이 있는 경우)

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.urls import reverse # urls.py의 path이름으로 설정된 url을 조회하는 메소드
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
        # # 응답페이지이동 -> Question객체
        # question = Question.objects.get(pk=question_id)
        # return render(request, "polls/vote_result.html", {"question":question})

        # vote_result를 요청하도록 응답. - http응답 상태코드: 302, 이동할 url  ==> redirect()
        # response = redirect(f"/polls/vote_result/{question_id}")
        url = reverse("polls:vote_result", args=[question_id])  # app_name이 polls인 urls.py에서 name=vote_result인 설정의 url을 조회
        print("reverse()가 생성한 url:", type(url), url)
        response = redirect(url)
        print(type(response))
        return response
    
    else: # 선택 안된 경우(예외상황) -> vote_form.html 이동
        question = Question.objects.get(pk=question_id)
        return render(
            request, 
            "polls/vote_form.html", 
            {"question": question, "error_message":"보기를 선택하세요."}
        )
    
#################################
# question_id를 받아서 그 질문의 투표 결과를 응답하는 View
#
# URL: polls/vote_result/질문_id
# view: vote_result
# 응답 template: polls/vote_result.html
def vote_result(request, question_id):
    question = Question.objects.get(pk=question_id)
    return render(request, "polls/vote_result.html", {"question":question})

####################################################
# 설문 질문 등록
#  
#  요청 url: polls/vote_create
#  view 함수: vote_create
##   -  GET방식요청 : 등록 폼을 제공
##   -  POST방식요청: 등록 처리
#  응답 template
##    - GET방식요청 : polls/vote_create.html
##    - POST방식요청: list로 이동 => redirect 방식으로 이동.

# HTTP 요청방식 조회 - HttpRequest.method => "GET", "POST"

def vote_create(request):
    http_method = request.method
    if http_method == "GET":
        return render(request, "polls/vote_create.html")
    elif http_method == "POST":
        # 요청파라미터 읽기 - 질문, 보기들
        question_text = request.POST.get("question_text")
        # 같은이름으로 여러개 값이 전달된 경우 getlist("요청파라미터이름"): list
        choice_list = request.POST.getlist("choice_text")

        #  DB에 저장
        q = Question(question_text=question_text)
        q.save()
        for choice_text in choice_list:
            c = Choice(choice_text=choice_text, question=q)
            c.save()

        #  응답 - list로 redirect방식으로 이동.
        # return redirect("/polls/list")
        return redirect(reverse("polls:list"))
