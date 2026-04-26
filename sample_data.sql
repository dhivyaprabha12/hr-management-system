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
