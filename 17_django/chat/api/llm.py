from langchain_openai import ChatOpenAI
from langchain.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.output_parsers import StrOutputParser

class Chatting:
    """
    대화형 AI 채팅 클래스.    
    GPT 모델을 사용하여 사용자와 대화를 수행하고, 대화 기록을 관리한다.
    """

    def __init__(self):
        """LLM 과 대화하는 Chain을 구성한다.
        """
        model = ChatOpenAI(model="gpt-4o-mini")
        prompt_template = ChatPromptTemplate(
            [
                ("system", "너는 나의 친구야. 친근한 말투로 대화를 진행해줘."),
                MessagesPlaceholder(variable_name="history", optional=True),
                ("user", "{query}")
            ]
        )
        output_parser = StrOutputParser()
        self.chain = prompt_template | model | output_parser    

    def send_message(self, message:str, history:list):
        """
        사용자 메시지를 처리하고 AI 응답을 반환.
        Parameter:
            message: str 사용자가 입력한 메시지
            history: list - 사용자와 AI간의 이전까지의 대화 기록

        Returns:
            str: AI의 응답 메시지
        """
        response = self.chain.invoke({"history": history, "query": message})
        
        return response
    


def add_message_to_history(history:list[tuple[str, str]], message:tuple[str, str], max_history=20):
    """
    Message를 history에 추가하는 util 메소드.
    파라미터로 받은 history에 message를 추가한다.
    max_history 개수를 넘어가면 오래된 것 부터 지운다.
    Parameter:
        history: list - 대화 기록
        message: tuple - (speaker, message) 형태의 메시지
        max_history: int - 저장할 최대 대화 기록 개수
    """
    while len(history) >= max_history:
        history.pop(0)
    history.append(message)
        
        