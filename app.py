import streamlit as st

# -------------------------------
# Page Config
# -------------------------------
st.set_page_config(page_title="HR System", layout="wide")

# -------------------------------
# Custom Styling (VERY IMPORTANT)
# -------------------------------
st.markdown("""
<style>

/* App background */
.stApp {
    background-color: #f4f6f9;
}

/* Center Title */
.main-title {
    text-align: center;
    font-size: 48px;
    font-weight: bold;
    color: #2c3e50;
    margin-bottom: 10px;
}

/* Subtitle */
.sub-title {
    text-align: center;
    font-size: 20px;
    color: #7f8c8d;
    margin-bottom: 30px;
}

/* Bigger text everywhere */
html, body, [class*="css"]  {
    font-size: 18px;
}

/* Sidebar styling */
section[data-testid="stSidebar"] {
    background-color: #2c3e50;
    color: white;
}

/* Buttons */
.stButton>button {
    background-color: #3498db;
    color: white;
    font-size: 16px;
    border-radius: 8px;
}

/* Table styling */
.stDataFrame {
    border-radius: 10px;
}

</style>
""", unsafe_allow_html=True)

# -------------------------------
# Title Section
# -------------------------------
st.markdown('<div class="main-title">🏢 Smart HR Management System</div>', unsafe_allow_html=True)
st.markdown('<div class="sub-title">Manage Employees • Track Attendance • Generate Insights</div>', unsafe_allow_html=True)

st.divider()

# -------------------------------
# Info Section
# -------------------------------
st.info(" Use the sidebar to navigate between different modules")

# -------------------------------
# Optional Dashboard Cards
# -------------------------------
col1, col2, col3 = st.columns(3)

col1.metric("Employees", "Manage Data")
col2.metric("Attendance", "Track Daily")
col3.metric("Reports", "Analyze Trends")