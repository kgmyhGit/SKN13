import streamlit as st
import pandas as pd
import numpy as np
    
####################################################################################
# 표(Table 출력)
# 
# Pandas DataFrame
# 테이블(표) 데이터를 표현하는 자료구조. Pandas 패키지를 설치한 뒤 사용할 수있다.
# pip install pandas
####################################################################################

st.header("DataFrame 출력")
st.subheader('dataframe()')
# DataFrame 생성
df = pd.DataFrame({
    'column1': [1, 2, 3, 4],
    'column2': [10, 20, 30, 40],
})

# DataFrame 의 표 출력
## st.dataframe(): interactive Viewer -> dataframe 크기 조절 가능. 컬럼명을 클릭하면 오름차순/내림차순 정렬이 toggle된다.
st.subheader('st.dataframe()')
st.dataframe(df)

## 가로 길이 조정.
# st.dataframe(df, use_container_width=False) # use_container_width=False: 값의 크기에 맞춰 길이를 정한다. True(Default): 전체 화면 길이
# st.dataframe(df, width=400)

# DataFrame 값 변경가능하게 출력
## 값이 변경될 때마다 변경된 DataFrame을 반환한다.
st.subheader('st.data_editor()')
change_df = st.data_editor(df)
print(change_df)
a = 10
b = 20
# st.table(): 테이블(static - interactive 기능 없이 표만 출력)
st.subheader('st.table()')
st.table(df)

st.divider()


#########################################################
#  st.metric() 값의 등락을 출력 하는 함수.
#########################################################
st.header('값의 등락 출력 - st.metric()')

st.metric(
    label=":blue[온도 ]",   # header/title. markdown, 이모지 shortcode, latex($, $$ 로 감싼다.), color text지원.
    value="10°C",           # 출력할 값
    delta="1.2°C"           # metric의 등락 크기값(옵션). `+` 로 시작하거나 생략하면 오름, `-` 로 시작하면 내림.
)
st.metric(label="삼성전자**", value="60,600원", delta="-700원 (-1.14%)")
