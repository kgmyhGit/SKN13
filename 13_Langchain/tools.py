# tavily_search를 이용해서 web 검색을 처리하는 툴
from typing import Literal # 넣을 수있는 값이 정해진 경우.
from langchain_tavily import TavilySearch
from langchain_core.tools import tool
from langchain_community.document_loaders import WikipediaLoader
from langchain_core.runnables import chain
from langchain_chroma import Chroma
from langchain_openai import OpenAIEmbeddings

from pydantic import BaseModel, Field

@tool
def search_web(query:str, 
               max_results:int=3, 
               time_range:Literal["day", "week", "month", "year"]|None=None
             ) -> dict:
    """
    데이터베이스에 존재하지 않는 정보나, 최신정보를 찾기 위해서 인터넷 검색을 하는 Tool입니다.
    """
    tavily_search = TavilySearch(max_results=max_results, time_range=time_range)
    ######################################################################
    # tavily_searh 이외의 검색 툴들을 이용해서 다양한 검색 결과들을 취함
    ######################################################################
    search_result = tavily_search.invoke(query)["results"] #{..., "results":list[dict]}
    if search_result: # 검색 결과가 있다.
        return {"result": search_result}
    else: # 검색결과가 없다면
        return {"result": "검색 결과가 없습니다."}
    



@chain
def wikipedia_search(input_dict: dict) -> dict:
    """사용자 query에 대한 정보를 위키백과사전에서 k개 문서를 검색하는 Runnable."""

    query = input_dict['query'] #검색어
    max_results = input_dict.get("max_results", 2) # 조회문서 최대 개수. default: 2

    wiki_loader = WikipediaLoader(query=query, load_max_docs=max_results, lang="ko")
    search_result = wiki_loader.load() # list[Document]
    if search_result: #검색결과가 있다면  # Document -> dictionary
        result_list = []
        for doc in search_result:
            result_list.append({"content":doc.page_content, 
                                "url":doc.metadata['source'], 
                                "title":doc.metadata['title']})
        return {"result": result_list}
    else:
        return {"result":"검색 결과가 없습니다."}
    
# Runnable을 tool 생성 - runnable.as_tool(툴정보)
class SearchWikiArgsSchema(BaseModel):
    query: str = Field(..., description='위키백과사전에서 검색할 키워드, 검색어')
    max_results: int = Field(default=2, description="검색할 문서의 최대개수")

search_wiki = wikipedia_search.as_tool(
    name="search_wikipedia", # 툴 이름.
    description=("위키 백과사전에서 정보를 검색할 때 사용하는 tool.\n"
                 "사용자의 질문과 관련된 위키백과사전의 문서를 지정한 개수만큼 검색해서 반환합니다.\n"
                 "일반적인 지식이나 배경 정보가 필요한 경우 유용하게 사용할 수있는 tool입니다."),
    args_schema=SearchWikiArgsSchema # 파라미터(argument)에대한 설계 -> pydantic 모델 정의
)


#######################
# 메뉴 검색 툴
########################
COLLECTION = "restaurant_menu"
PERSIST_DIRECTORY = "vector_store/chroma/restaurant_menu_db"

embedding_model = OpenAIEmbeddings(model="text-embedding-3-large")
vector_store = Chroma(
    embedding_function=embedding_model,
    collection_name=COLLECTION,
    persist_directory=PERSIST_DIRECTORY
)

# Retriever 생성
menu_retriever = vector_store.as_retriever(
    search_kwargs={"k":3}
)

@tool
def search_menu(query:str) -> dict:
    """Vector Store(Vector Database)에 저장된 레스토랑의 메뉴를 검색하는 tool.
    이 tool은 query와 가장 연관된 메뉴를 Vector Database에서 검색해서 반환한다.
    레스토랑 메뉴와 관련된 검색은 이 tool을 사용한다.
    """
    menu_result_list = menu_retriever.invoke(query)
    result_list = []
    for menu_doc in menu_result_list:
        result_list.append({"content":menu_doc.page_content, 
                            "title":menu_doc.metadata['menu_name'], 
                            "url":menu_doc.metadata["source"]})
    if not result_list: # 비었으면 -> 검색결과가 없으면
        result_list = "검색된 정보가 없습니다."
    return {"result": result_list}