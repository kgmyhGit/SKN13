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
        fields = ["username", "password1", "password2", "name", "email", "birthday"] # 특정 model field들을 선택해서 구성.
        # exclude = ["name"] # 지정한 model field를 제외한 나머지로를 이용해서 구성. (fields와 exclude는 같이 사용 못한다.)

