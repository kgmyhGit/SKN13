# polls/admin.py
from django.contrib import admin
# from polls.models import Question, Choice
from .models import Question, Choice
# .models -> 상대경로로 import. 
#            models.py와 admin.py가 같은 패키지에 있는 모듈.

# Model 클래스들을 admin  app에서 관리할 수있도록 등록
admin.site.register(Question)
admin.site.register(Choice)
