##################################################################
 # streamlit/05_streamlit_chat_exam_session_state_llm_streaming_memory2.py
##################################################################
import streamlit as st
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from langchain.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.output_parsers import StrOutputParser
from langchain_community.chat_message_histories import SQLChatMessageHistory
from sqlalchemy import create_engine
from langchain_core.runnables import RunnableWithMessageHistory


# 프롬프트 -> LLM 요청 -> 응답 -> chat_message container에 출력

# LLM 모델 생성
@st.cache_resource
def get_llm_model():
    load_dotenv()
    model = ChatOpenAI(model_name="gpt-4o-mini")
    prompt_template = ChatPromptTemplate(
        messages=[
            ("system", "답변을 100단어 이내로 작성해주세요."),
            MessagesPlaceholder(variable_name="history", optional=True), # 대화 이력
            ("user", "{query}")  # 사용자 질문.
        ]
    )
    return prompt_template | model | StrOutputParser()

@st.cache_resource
def get_chain():
    # RunnableWithMessageHistory를 생성해서 반환.
    engine = create_engine("sqlite:///chat_history.sqlite")
    runnable = get_llm_model()
    chain = RunnableWithMessageHistory(
        runnable=runnable,
        get_session_history=lambda session_id : SQLChatMessageHistory(session_id=session_id, connection=engine),
        input_messages_key="query",
        history_messages_key="history"
    )
    return chain

model = get_chain()

st.title("Chatbot+session state 튜토리얼")

# session_state에 "messages"가 없으면 대화이력을 저장할 빈 리스트 생성.
if "messages" not in st.session_state:
    st.session_state["messages"] = []

# session_state에서 session_id를 조회. 없으면 빈 상태값을 저장.
if "session_id" not in  st.session_state:
    st.session_state["session_id"] = None

# Sidebar에 session_id 입력 위젯 생성
session_id = st.sidebar.text_input("Session ID", placeholder="대화 ID를 입력하세요.")

######################################
#  기존 대화 이력을 출력
######################################
message_list = st.session_state["messages"]
for message in message_list:
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
    # 입력된 Session id를 상태값으로 저장
    if st.session_state["session_id"] is None:
        st.session_state['session_id'] = session_id

    config = {"configurable": {"session_id": st.session_state['session_id']}}

    with st.chat_message("ai"):
        message_placeholder = st.empty() # update가 가능한 container
        full_message = "" # LLM이 응답하는 토큰들을 저장할 문자열변수.
        for token in model.stream({"query":prompt}, config=config):
            full_message += token
            message_placeholder.write(full_message) # 기존 내용을 full_message로 갱신.
            
        st.session_state["messages"].append({"role":"ai", "content":full_message})


