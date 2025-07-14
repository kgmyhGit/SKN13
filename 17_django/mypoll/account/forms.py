# account/forms.py
## Form이나 ModelForm 클래스들을 정의하는 모듈
## 보통 Form은 등록/수정 폼 각각 하나씩 정의.

### User 등록폼, User 수정폼 ==> ModelForm

from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import User

# ModelForm: forms.ModelForm을 상속, Form: forms.Form을 상속

# UserCreationForm 에 정의된 Form필드: username, password1, password2
# CustomUserCreationForm: UserCreationForm의 form필드 + name, email, birthday
class CustomUserCreationForm(UserCreationForm): 
    
    class Meta:
        model = User  # User Model의 model field를 이용해서 Form field를 구성.
        # fields = "__all__" # 모델의 모든 field들을 이용해서 구성.
        fields = ["username", "password1", "password2",
                  "name", "email", "birthday", "profile_img"] # 특정 model field들을 선택해서 구성.
        # exclude = ["name"] # 지정한 model field를 제외한 나머지로를 이용해서 구성. (fields와 exclude는 같이 사용 못한다.)

        # Form Field들의 input type을 변경.
        ## birthday input type=text ==> input type=date
        # key: field이름 value: Widget객체
        widgets = {
            "birthday":forms.DateInput(attrs={"type":"date"}),
            # "name":forms.PasswordInput()
        }
    
    #############################
    # 검증
    # Form/ModelForm에서 하는 기본 검증
    #  - blank=False: required 검증
    #  - 숫자 입력: 숫자인지 검증
    #  - Email/일시 입력: email/일시 형식을 검증.
    # 
    # 검증 메소드를 추가. - 도메인 특화 검증을 할 경우 정의
    #  - clean(): 모든 필드들을 한번에 검증
    #  - clean_field이름(): 개별 field를 검증.
    #  - 검증시 문제가 발생하면 forms.ValidationError("에러이유메세지") 발생.
    #  - 검증시 문제가 없으면 검증한 값(요청파라미터)를 반환.

    # name: 두글자 이상 입력.
    def clean_name(self):
        # self.cleaned_data : dictionary - 기본 검증을 통과한 요청파라미터들을 조회.
        name = self.cleaned_data['name']
        if len(name) < 2:
            raise forms.ValidationError("사용자 이름은 두글자 이상 입력하세요.")
        
        return name
        
# 회원정보 수정 폼 - ModelForm
class CustomUserChangeForm(UserChangeForm):
    
    password = None  # 비밀번호 변경 설정 링크가 안나오도록 설정.
    
    class Meta:
        model = User
        fields = ["name", "email", "birthday", "profile_img"]
        widgets = {
            "birthday":forms.DateInput(attrs={"type":"date"})
        }
    # name: 두글자 이상 입력.
    def clean_name(self):
        # self.cleaned_data : dictionary - 기본 검증을 통과한 요청파라미터들을 조회.
        name = self.cleaned_data['name']
        if len(name) < 2:
            raise forms.ValidationError("사용자 이름은 두글자 이상 입력하세요.")
        
        return name