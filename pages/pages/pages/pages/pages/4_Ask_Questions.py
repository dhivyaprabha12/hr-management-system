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

st.title("Ask Questions")

conn = get_connection()

question = st.selectbox("Select Question", [
    "Total Attendance Summary",
    "Employee-wise Attendance",
    "Check Specific Employee Attendance",
    "Employees with Most Absences",
    "Late Coming Analysis"
])

# -----------------------------------
# 1. Total Attendance Summary
# -----------------------------------
if question == "Total Attendance Summary":
    df = pd.read_sql("SELECT * FROM attendance_summary", conn)
    st.subheader(" Overall Attendance Summary")
    st.dataframe(df)

# -----------------------------------
# 2. Employee-wise Attendance
# -----------------------------------
elif question == "Employee-wise Attendance":
    query = """
    SELECT 
        e.name,
        COUNT(a.attendance_id) AS total_days,
        SUM(a.status = 'Present') AS present_days,
        SUM(a.status = 'Absent') AS absent_days
    FROM Employees e
    LEFT JOIN Attendance a ON e.emp_id = a.emp_id
    GROUP BY e.emp_id
    """
    df = pd.read_sql(query, conn)

    st.subheader("Employee Attendance Overview")
    st.dataframe(df)

# -----------------------------------
# 3. Specific Employee
# -----------------------------------
elif question == "Check Specific Employee Attendance":
    emp_id = st.number_input("Enter Employee ID", min_value=1)

    if st.button("Get Details"):
        query = f"""
        SELECT 
            e.name,
            COUNT(a.attendance_id) AS total_days,
            SUM(a.status = 'Present') AS present_days,
            SUM(a.status = 'Absent') AS absent_days,
            SUM(a.status = 'Late') AS late_days
        FROM Employees e
        LEFT JOIN Attendance a ON e.emp_id = a.emp_id
        WHERE e.emp_id = {emp_id}
        GROUP BY e.emp_id
        """
        df = pd.read_sql(query, conn)
        st.dataframe(df)

# -----------------------------------
# 4. Most Absences
# -----------------------------------
elif question == "Employees with Most Absences":
    query = """
    SELECT 
        e.name,
        SUM(a.status = 'Absent') AS absent_days
    FROM Employees e
    JOIN Attendance a ON e.emp_id = a.emp_id
    GROUP BY e.emp_id
    ORDER BY absent_days DESC
    LIMIT 5
    """
    df = pd.read_sql(query, conn)

    st.subheader("🚨 Top Employees with Absences")
    st.dataframe(df)

# -----------------------------------
# 5. Late Analysis
# -----------------------------------
elif question == "Late Coming Analysis":
    query = """
    SELECT 
        e.name,
        SUM(a.status = 'Late') AS late_count
    FROM Employees e
    JOIN Attendance a ON e.emp_id = a.emp_id
    GROUP BY e.emp_id
    ORDER BY late_count DESC
    """
    df = pd.read_sql(query, conn)

    st.subheader(" Late Coming Analysis")
    st.dataframe(df)
