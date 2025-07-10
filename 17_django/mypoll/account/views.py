# account/views.py
from django.shortcuts import render

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
        pass