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

st.title("Attendance")

conn = get_connection()

df = pd.read_sql("""
SELECT e.name, a.attendance_date, a.status
FROM Attendance a
JOIN Employees e ON e.emp_id = a.emp_id
""", conn)

st.dataframe(df)
