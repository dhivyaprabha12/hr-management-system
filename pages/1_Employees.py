import streamlit as st
import pandas as pd
from db import get_connection
st.markdown("""
<style>
h1 {
    font-size: 64px !important;
    color: #2c3e50;
}
</style>
""", unsafe_allow_html=True)

st.title("Employees")

conn = get_connection()

df = pd.read_sql("SELECT * FROM Employees", conn)

st.dataframe(df)
