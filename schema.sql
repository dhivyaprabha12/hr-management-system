create database hr_system;
use hr_system
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    joining_date DATE,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    attendance_date date,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20),
    CONSTRAINT unique_attendance UNIQUE (emp_id, attendance_date),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

CREATE TABLE Absent (
    Absent_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    Absent_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);




select * from attendance;
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM Attendance;

DELIMITER $$

CREATE TRIGGER attendance_before_insert
BEFORE INSERT ON Attendance
FOR EACH ROW
BEGIN

    SET NEW.attendance_date = IFNULL(NEW.attendance_date, CURRENT_DATE);

    IF NEW.check_in IS NULL THEN
        SET NEW.status = 'Absent';
    ELSEIF NEW.check_in <= '09:00:00' THEN
        SET NEW.status = 'Present';
    ELSEIF NEW.check_in <= '11:00:00' THEN
        SET NEW.status = 'Late';
    ELSE
        SET NEW.status = 'Half-day';
    END IF;

END $$

DELIMITER ;


