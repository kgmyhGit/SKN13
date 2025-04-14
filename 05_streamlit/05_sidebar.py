import streamlit as st
import pandas as pd
import numpy as np
      
############################################################
# sidebar는 화면 왼쪽에 생기는 패널로 `st.sidebar`를 통해 정의한다.
# sidebar에는 검색 조건과 같은 사용자 입력 항목들을 넣는다.
# 본화면에서는 sidebar에서 선택한 내용을 처리한 내용을 넣는다.
# 
# - 구현
#   - st.sidebar 를 통해 함수를 호출하면 sidebar에 출력된다.
#   - with st.sidebar: 블록에서 sidebar에 작성할 내용을 구현한다.
############################################################
st.set_page_config(page_title="타이틀")


v1 = st.sidebar.slider("X", 1, 10)
st.write("선택된 값: ", f"**{v1}**")

v2 = st.sidebar.text_input("이름")
st.write("이름: " + f"**{v2}**")

v3 = st.sidebar.radio(
    "지역선택",
    ["서울", "인천", "부산"],
    captions=["2020", "2020", "2023"],
    index=None,  # 아무것도 선택되지 않도록 한다.
)

#######################
# With 문으로 정의
#######################
# with st.sidebar:
#    wv1 = st.slider("Y", 1, 10)
#    wv2 = st.text_input("이름")
#    wv3 = st.radio(
#        "지역선택",
#        ["서울", "인천", "부산"],
#        captions=["2020", "2020", "2023"],
#        index=None,  # 아무것도 선택되지 않도록 한다.
#    )

# st.write("선택된 값: ", f"**{wv1}**")
# st.write("이름: " + f"**{wv2}**")
# st.write(f"선택한 지역: **{wv3}**")
