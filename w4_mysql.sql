/*
	# Wk 4 homework
    # Student: Mauricio Sanchez
    # Date: Nov 24th 2015
    #Description: To create a single SQL table of a sample company's organizational chart. 
				  You may run this file as a script to test it out.
*/

DROP DATABASE IF EXISTS company;

COMMIT;

CREATE DATABASE company;

USE company;

CREATE TABLE company_hierarchy(
	employee_id INT(6) NOT NULL,
    employee_name VARCHAR(255),
    employee_title VARCHAR(255),
    supervisor_id INT(6) NULL,
    PRIMARY KEY (employee_id)
);

INSERT INTO company_hierarchy (employee_id, employee_name, employee_title, supervisor_id)
VALUES
(1, 'Brent Mcquail', 'President and CEO', NULL),
(2, 'Jeffrey Buson', 'Vice-President', 1),
(3, 'Kevin Piccolo', 'Art Director', 2),
(4, 'Susan Parkins', 'Office Manager', 2),
(5, 'Rick Jameson', 'IT Director', 2),
(6, 'Jason Johansen', 'Director of Business Development', 2),
(7, 'Anh Nguyen', 'Associate Artist', 3),
(8, 'Napoleon Wells', 'Associate Artist', 3),																																																									
(9, 'Brad Thompson', 'Concept Artist', 3),
(10, 'Conrad Hopkins', 'Concept Artist', 3),
(11, 'Maly Lee', 'Executive Assistant', 4),
(12, 'Mickey Korinth', 'Public Relations Specialist', 6),
(13, 'Vincent Forwards', 'Assistant Producer', 10);


SELECT Employees.employee_name,
	   Employees.employee_title,
       Supervisors.employee_name AS 'REPORTS TO'
FROM company_hierarchy AS Employees
LEFT JOIN company_hierarchy AS Supervisors
ON Employees.supervisor_id = Supervisors.employee_id
GROUP BY Employees.employee_name,
	     Employees.employee_title,
         Supervisors.employee_name
ORDER BY Supervisors.employee_name ASC;



















