import streamlit as st
import pandas as pd
from db import get_connection
st.markdown("""
<style>
h1 {
    font-size: 32px !important;
    color: #2c3e50;
}
</style>
""", unsafe_allow_html=True)

st.title("Absent")

conn = get_connection()

df = pd.read_sql("SELECT * FROM Absent", conn)

st.dataframe(df)
