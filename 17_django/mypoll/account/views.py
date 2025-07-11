# account/views.py
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth.forms import (
    AuthenticationForm, # 로그인 폼
    PasswordChangeForm  # 비밀번호 변경 폼
)
from django.contrib.auth import (
    login, # 로그인 처리 함수. 로그인한 사용자의 User Model객체를 session에 저장해서 **로그인상태를 유지**하도록 한다.
    logout, # 로그아웃 처리 함수. 로그인 상태를 종료.
    authenticate # 인증 확인 함수. (username, password를 DB에서 확인)
)
from django.contrib.auth.decorators import login_required 

from .forms import CustomUserCreationForm


#######################################
# 사용자 가입 처리
# 요청 url : account/create
#      GET  - 가입 폼 양식을 응답
#      POST - 가입처리
# view 함수: create
# 응답: GET -  templates/account/create.html
#       POST - home으로 이동. redirect

def create(request):
    if request.method == "GET":
        return render(request, "account/create.html", {"form":CustomUserCreationForm()})
    else: # POST
        # 가입처리
        # 1. 요청파라미터 조회. 
        form = CustomUserCreationForm(request.POST, request.FILES)
        # 요청파라미터로 넘어온 값들을 Form의 instance변수(attribute)에 저장. + 검증작업

        # 2. 요청파라미터 검증
        #    form.is_valid(): bool -> True: 검증 성공, False: 검증 실패
        if form.is_valid(): 
            # 검증 성공 -> 가입처리
            # form: ModelForm 은 save() 기능제공 -> DB insert. 
            #      반환: insert처리한 결과를 가진 Model을 반환.
            user = form.save()
            print('----가입: user:', type(user), user)
            return redirect(reverse("home"))
        else: 
            # 검증 실패 -> 실패처리 -> 가입화면으로 이동.
            return render(
                request, "account/create.html", {"form": form} # 요청파라미터와 검증결과를 가진 form을 전달.
            )
        
############################################
# Loging 처리 View
# 요청 URL: /account/login
# view: user_login
#      - GET:  Login form 제공
#      - POST: Login 처리
# template
#      - GET: templates/account/login.html, POST: home (redirect)

def user_login(request):
    if request.method == "GET":
        # 로그인 폼을 응답
        return render(request, "account/login.html", {"form":AuthenticationForm()})
    else:
        # 로그인 처리 -> username/password 확인 -> 로그인 상태 유지 처리
        # username/password 조회
        username = request.POST['username']
        password = request.POST['password']

        # User모델(settings.AUTH_USER_MODEL)을 기반으로 사용자 인증 처리.(DB로 부터 username, password를 확인)
        ##  유효한 username/password 이면 User 모델객체를 반환.
        ##  유효하지 않은 경우 None을 반환.
        user = authenticate(request, username=username, password=password)
        if user is not None:
            # 유효한 사용자 계정
            login(request, user) # 로그인 처리 (로그인 상태 유지)
            
            next_url = request.GET.get("next")
            if next_url is not None: # account/login?next=/poll/vote_create
                return redirect(next_url)

            return redirect(reverse("home"))
        else:
            # 유효하지 않은 사용자 계정
            return render(request, "account/login.html", 
                          {"form":AuthenticationForm(), 
                           "error_message":"username 또는 password를 다시 확인하세요."})
        
#################################
# Logout  처리
# url: /account/logout
# view: user_logout
# template: redirect방식 - home

@login_required
def user_logout(request):
    logout(request)  # 로그아웃 처리. 로그인 상태유지 종료. 
    return redirect(reverse("home"))

#################
# 사용자 정보를 조회하는 View
#   - 단순히 template만 실행해서 응답하는 View
#   - TemplateView.as_view(template_name="template경로") ==> urls.py
# @login_required
# def detail(request):
#     return render(request, "account/detail.html")