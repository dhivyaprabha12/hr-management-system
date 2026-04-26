# HR Management System

## 📌 Overview

This project is a Streamlit-based HR Management System integrated with a MySQL database.
It helps manage employees, track attendance, and generate basic analytics through an interactive dashboard.

---

## 🚀 Features

* Employee Management
* Attendance Tracking (Present, Late, Absent, Half-day)
* Automated Attendance Status using MySQL Triggers
* Query-based Insights (Top absences, late analysis, etc.)

---

## 🛠️ Technologies Used

* Python (Streamlit)
* MySQL
* Pandas

---

## ⚙️ Database Design

* **Departments** – Stores department details
* **Employees** – Stores employee information
* **Attendance** – Tracks daily attendance
* **Triggers** – Automatically:

  * Set attendance date
  * Assign attendance status based on check-in time

---

## ▶️ How to Run the Project

### 1. Install dependencies

pip install -r requirements.txt

### 2. Setup Database

* Run `schema.sql` to create tables and triggers
* Run `sample_data.sql` to insert sample data

### 3. Configure Database Connection

* Open `db.py`
* Update:

  * host
  * user
  * password
  * database name

### 4. Run the application

streamlit run app.py

---

## 📊 Pages Included

* Employees
* Attendance
* Absent
* Ask Questions (Analytics)

---

## 📌 Notes

* Attendance status is automatically calculated using MySQL triggers
* Unique constraint ensures one attendance record per employee per day

---

## 📷 Future Improvements

* Add authentication
* Deploy online
* Add advanced analytics
