import streamlit as st


st.title("Page 1")
st.write("**Page 1**")

st.subheader("링크")
st.page_link("pages/page1.py", label="Page 1", icon='👍')
st.page_link("pages/page2.py", label="Page 2")
st.page_link("pages/page3.py", label="Page 3")