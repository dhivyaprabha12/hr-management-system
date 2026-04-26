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
DELIMITER $$

CREATE TRIGGER attendance_before_insert
BEFORE INSERT ON Attendance
FOR EACH ROW
BEGIN
    SET NEW.attendance_date = CURRENT_DATE;
    IF EXISTS (
        SELECT 1 FROM Leaves
        WHERE emp_id = NEW.emp_id
        AND CURRENT_DATE BETWEEN start_date AND end_date
        AND status = 'Approved'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee is on leave';
    END IF;

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
INSERT INTO Departments (department_name)
VALUES 
('Finance'),
('Marketing'),
('Sales'),
('Admin');
INSERT INTO Employees (name, department_id, salary)
VALUES
('Nakshu', 1, 28000),
('Aru', 2, 35000),
('Madhu', 3, 45000),
('Dhivya', 4, 30000),
('Varun', 1, 32000),
('Aakkash', 2, 38000),
('irfana', 3, 50000),
('Rithu', 4, 27000),
('Pradhi', 1, 31000),
('hashmitha', 2, 36000),
('shree', 3, 42000),
('Kavya', 4, 29000),
('aadhu', 1, 34000),
('Pooja', 2, 37000),
('Naveen', 3, 48000);
select * from departments;
Drop view if exists attendance_summary;
CREATE VIEW attendance_summary AS
SELECT 
    COUNT(*) total,
    SUM(status='Present') as present,
    SUM(status='Absent') as absent,
    SUM(status='Late') as  late
FROM Attendance;
select * from attendance;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Attendance;
DELETE FROM Absent;
DELETE FROM Employees;
DELETE FROM Departments;
INSERT INTO Departments (department_name) VALUES
('HR'),
('IT'),
('Finance'),
('Marketing');
INSERT INTO Employees (name, department_id, salary) VALUES
('Asha', 1, 30000),
('Ravi', 2, 40000),
('Kiran', 3, 45000),
('Meena', 4, 35000),
('Arjun', 1, 32000),
('Divya', 2, 38000),
('Suresh', 3, 41000),
('Priya', 4, 36000),
('Vikram', 1, 50000),
('Anjali', 2, 27000),
('Rahul', 3, 31000),
('Sneha', 4, 34000),
('Manoj', 1, 42000),
('Kavya', 2, 29000),
('Deepak', 3, 46000);
truncate table Departments;
truncate table Employees;
drop table departments;
drop table Employees;
drop table Attendance;
drop table Absent;
INSERT INTO Absent (emp_id, start_date, end_date, status) VALUES
(1, CURDATE() - INTERVAL 2 DAY, CURDATE() + INTERVAL 1 DAY, 'Approved'),
(3, CURDATE() - INTERVAL 5 DAY, CURDATE() - INTERVAL 3 DAY, 'Approved'),
(5, CURDATE(), CURDATE() + INTERVAL 2 DAY, 'Pending'),
(7, CURDATE() - INTERVAL 1 DAY, CURDATE() + INTERVAL 1 DAY, 'Approved'),
(10, CURDATE() - INTERVAL 3 DAY, CURDATE() - INTERVAL 1 DAY, 'Rejected');
INSERT INTO Attendance (emp_id, attendance_date, check_in, status) VALUES
(2, CURDATE(), '09:00:00', 'Present'),
(4, CURDATE(), '10:15:00', 'Late'),
(6, CURDATE(), '11:30:00', 'Half-day'),
(8, CURDATE(), NULL, 'Absent'),
(9, CURDATE(), '08:50:00', 'Present'),
(11, CURDATE(), '09:30:00', 'Late'),
(12, CURDATE(), NULL, 'Absent'),
(13, CURDATE(), '09:05:00', 'Present'),
(14, CURDATE(), '10:45:00', 'Late'),
(15, CURDATE(), '11:10:00', 'Half-day'),

(2, CURDATE() - INTERVAL 1 DAY, '09:10:00', 'Present'),
(4, CURDATE() - INTERVAL 1 DAY, NULL, 'Absent'),
(6, CURDATE() - INTERVAL 1 DAY, '10:30:00', 'Late'),
(8, CURDATE() - INTERVAL 1 DAY, '09:00:00', 'Present'),
(9, CURDATE() - INTERVAL 1 DAY, '08:55:00', 'Present');
DROP TRIGGER attendance_before_insert;
DELIMITER $$

CREATE TRIGGER attendance_before_insert
BEFORE INSERT ON Attendance
FOR EACH ROW
BEGIN

    SET NEW.attendance_date = CURRENT_DATE;

    IF EXISTS (
        SELECT 1 FROM Absent
        WHERE emp_id = NEW.emp_id
        AND CURRENT_DATE BETWEEN start_date AND end_date
        AND status = 'Approved'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee is on leave';
    END IF;

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
INSERT INTO Attendance (emp_id, attendance_date, check_in, status) VALUES
(2, CURDATE(), '09:00:00', 'Present'),
(4, CURDATE(), '10:15:00', 'Late'),
(6, CURDATE(), '11:30:00', 'Half-day'),
(8, CURDATE(), NULL, 'Absent'),
(9, CURDATE(), '08:50:00', 'Present'),
(11, CURDATE(), '09:30:00', 'Late'),
(12, CURDATE(), NULL, 'Absent'),
(13, CURDATE(), '09:05:00', 'Present'),
(14, CURDATE(), '10:45:00', 'Late'),
(15, CURDATE(), '11:10:00', 'Half-day'),

(2, CURDATE() - INTERVAL 1 DAY, '09:10:00', 'Present'),
(4, CURDATE() - INTERVAL 1 DAY, NULL, 'Absent'),
(6, CURDATE() - INTERVAL 1 DAY, '10:30:00', 'Late'),
(8, CURDATE() - INTERVAL 1 DAY, '09:00:00', 'Present'),
(9, CURDATE() - INTERVAL 1 DAY, '08:55:00', 'Present');
DELETE FROM Attendance;
SELECT * FROM Attendance;
DROP TRIGGER attendance_before_insert;
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
TRUNCATE TABLE Attendance;
INSERT INTO Attendance (emp_id, attendance_date, check_in) VALUES
(2, CURDATE(), '09:00:00'),
(3, CURDATE(), '10:30:00'),
(4, CURDATE(), '11:30:00'),
(6, CURDATE(), '09:15:00'),
(8, CURDATE(), NULL),
(9, CURDATE(), '08:50:00'),
(11, CURDATE(), '09:45:00'),
(12, CURDATE(), NULL),
(13, CURDATE(), '09:05:00'),
(14, CURDATE(), '10:40:00'),

(2, CURDATE() - INTERVAL 1 DAY, '09:10:00'),
(3, CURDATE() - INTERVAL 1 DAY, '10:00:00'),
(4, CURDATE() - INTERVAL 1 DAY, NULL),
(6, CURDATE() - INTERVAL 1 DAY, '09:20:00'),
(8, CURDATE() - INTERVAL 1 DAY, '09:00:00');
