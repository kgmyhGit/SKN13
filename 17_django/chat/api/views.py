from django.http import JsonResponse
from datetime import datetime

from django.views.decorators.http import require_GET
from .llm import Chatting, add_message_to_history

@require_GET # get방식 요청만 처리
def chat_message(request, message):
    """
    대화를 수행하는 API 엔드포인트.
    path parameter로 사용자의 메시지를 받아서 AI의 응답을 반환한다.
    session을 이용해 대화 기록을 관리한다.
    """
    chat = Chatting()
    
    # session에서 대화내역(history)를 불러오기. (없으면-처음시작 빈 배열반환.)
    history = request.session.get("chatting_history", [])
    
    # llm에게 메세지 전송
    response = chat.send_message(message, history)
    
    # history에 message, response을 저장. (max_length가 넘으면 오래된 순으로 메세지 삭제)
    add_message_to_history(history, ("human", message))
    add_message_to_history(history, ("ai", response))

    # session에 변경된 대화내역(history) 업데이트.
    request.session["chatting_history"] = history

    # JsonResponse(dict): HttpResponse 타입
    ## dict를 JSON 응답으로 만들어서 응답.
    return JsonResponse({'response': response})
