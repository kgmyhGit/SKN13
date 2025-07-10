# account/models.py
from django.db import models
from django.contrib.auth.models import AbstractUser

# User 모델 등록
## AbstractUser를 상속받아서 확장 User모델로 정의

class User(AbstractUser):
    # username/password(AbstractUser) 를 제외한 나머지 Field들을 정의
    name = models.CharField(
        verbose_name="이름", # Form관련 설정. ModelForm을 만들 경우 form관련 설정을 Model field에 할수있다.
        max_length=50 # varchar(50)
    )
    email = models.EmailField(verbose_name="Email", max_length=100)
    # varchar(100) -> 검증기능이 추가: 값이 이메일 형식(@를 포함하는지)인지 여부를 검증
    birthday = models.DateField(
        verbose_name="생일",
        null=True,  # nullable
        blank=True, # 입력폼 설정 - 빈값입력 가능 여부(default: False - required)
    )

    def __str__(self):
        return f"{self.username} - {self.name}"

# settings.py에 사용자 정의 User 모델 등록
# database 삭제 (db.sqlite3 파일)
# python manage.py makemigrations
# python manage.py migrate