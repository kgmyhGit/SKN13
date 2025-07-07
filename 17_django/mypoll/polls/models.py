# polls/models.py

from django.db import models

# Model class ---- DB Table
## DB 테이블당 Model class를 정의
## django.db.models.Model 를 상속
## class변수로 DB Table의 컬럼과 연결된 변수들(Field)를 선언.
### - 변수명(컬럼명) = ModelField(type, 제약조건등 설정)

# Question (설문의 질문을 저장할 Model(table))
class Question(models.Model):
    # Model Field 들 선언 
    ## primay_key 컬럼을 선언하지 않으면 "`id`: 정수 자동증가 컬럼" 이 
    #                                              primary key 컬럼으로 생성된다.

    # question_text(질문) - varchar(문자열 - max length: 200)
    question_text = models.CharField(max_length=200)  # CharField == varchar
    # pub_date (질문 등록 일시) - datetime
    pub_date = models.DateTimeField(auto_now_add=True) # DateTimeField == datetime
    # auto_now_add - 처음 insert할 때 시점의 일시를 자동으로 저장(등록일시)
    # auto_now - insert/update 할 때 시점의 일시를 자동으로 저장(수정일시)

    # default: not null. Field에서 nullable 설정-> null=True
   
    def __str__(self):
        # 모델 instance를 출력/문자열로변환 할때 나올 값을 str로 반환.
        # self.Field 명 -> Field(테이블 컬럼)의 값
        # self.pk -> Primary key Field의 값을 반환.
        return f"{self.pk}. {self.question_text}"


# Choice(질문의 보기들을 저장할 Model)
class Choice(models.Model):
    
    choice_text = models.CharField(max_length=200) # 보기 문장
    votes = models.IntegerField(default=0) # insert할 때 값을 넣지 않으면 저장할 기본값을 설정(default)
    question = models.ForeignKey(
        Question, # 참조 모델 클래스
        on_delete=models.CASCADE, # 부모 테이블에서 참조하는 값이 삭제되면 같이 삭제. (models.SET_NULL - NULL로 업데이트)
    )
    # FK 설정 - ForeignKey(참조 Model클래스, on_delete설정)
    # class Meta:
    #     db_table="테이블이름"
    def __str__(self):
        return f"{self.pk}. {self.choice_text}"

# python manage.py makemigrations   [polls]
# python manage.py migrate