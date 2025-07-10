1.	프로젝트
   - 이름: mypoll
   - 설정파일 디렉토리: config
   -  `django-admin  startproject  config  .`
2.	App 생성
  - polls
  - `django-admin  startapp  polls`
  - `python manage.py startapp polls`
3.	config/settings.py
  - polls app 등록
     - `INSTALLED_APPS`  list에 `polls` 를 추가.
  - language 설정: ko-kr
  - timezone :  Asia/Seoul
4.	서버실행
  - `python manage.py runserver` : 개발서버를 실행.
  - 웹브라우저: http://127.0.0.1:8000

5. 각 App들과 관련된 데이터베이스 테이블들 생성.
  - `python manage.py makemigrations`
  - `python manage.py migrate`
6. 관리자 계정 생성
   - `python manage.py createsuperuser`
   - 계정, email, 패스워드
7. 관리자 app으로 연결
   - `python manage.py runserver`
   - http://127.0.0.1:8000/admin

# View 함수 구현
1. views.py 에 view 함수를 구현
   - 함수이름은 원하는대로 준다.
   - 필수 파라미터: HttpRequest 
2. urls.py에 요청 url 과 실행 view 함수를 연결
   - url mapping

# template 생성 (응답화면)
1. polls/templates/polls 디렉토리 생성
2. welcome.html


# 사용자 관리 app
- App을 생성
  - `python manage.py startapp account`
  - settings.py에 등록 (INSTALLED_APPS)
- User Model 정의
  - models.py 에 User모델클래스 정의
  - settings.py에 User모델을 등록
  - admin app에서 데이터 관리를 위해서 admin.py에 등록 + 화면구성 설정.