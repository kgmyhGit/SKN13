##################################################################
# #  streamlit/04_streamlit_chat_exam_session_state_llm_streaming.py
##################################################################
import streamlit as st
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI

# 프롬프트 -> LLM 요청 -> 응답 -> chat_message container에 출력

# LLM 모델 생성
@st.cache_resource
def get_llm_model():
    load_dotenv()
    return ChatOpenAI(model_name="gpt-4o-mini")

model = get_llm_model()

st.title("Chatbot+session state 튜토리얼")

# Session State를 생성
## session_state: dictionary 구현체. 시작 ~ 종료할 때 까지 사용자 별로 유지되야 하는 값들을 저장하는 곳.

# 0. 대화 내역을 session_state의 "messages":list 로 저장.
# 1. session state에 "messages" key가 있는지 조회(없으면 생성)
if "messages" not in st.session_state:
    st.session_state["messages"] = [] # 대화내용들을 저장할 리스트를 "messages" 키로 저장.

######################################
#  기존 대화 이력을 출력
######################################
for message in st.session_state["messages"]:
    with st.chat_message(message['role']):
        st.write(message['content'])

# 사용자의 프롬프트(질문)을 입력받는 위젯
prompt = st.chat_input("User Prompt") # 사용자가 입력한 문자열을 반환.

## 대화작업
if prompt is not None:
    # session_state에 messages에 대화내역을 저장.
    st.session_state["messages"].append({"role":"user", "content":prompt})
    with st.chat_message("user"):
        st.write(prompt)
    
    with st.chat_message("ai"):
        message_placeholder = st.empty() # update가 가능한 container
        full_message = "" # LLM이 응답하는 토큰들을 저장할 문자열변수.
        for token in model.stream(prompt):
            full_message += token.content
            message_placeholder.write(full_message) # 기존 내용을 full_message로 갱신.
            # print(full_message)
            # print("---------------------------------------")
        
        st.session_state["messages"].append({"role":"ai", "content":full_message})
