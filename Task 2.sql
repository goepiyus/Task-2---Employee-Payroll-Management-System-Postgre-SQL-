-- TASK 2
-- Project: Employee Payroll Management System (PostgreSQL)

CREATE TABLE employees (EMPLOYEE_ID int,
NAME text,
DEPARTMENT text,
EMAIL text,
PHONE_NO numeric,
JOINING_DATE date,
SALARY numeric,
BONUS numeric,
TAX_PERCENTAGE numeric);

INSERT INTO employees 
(EMPLOYEE_ID, NAME, DEPARTMENT, EMAIL, PHONE_NO, JOINING_DATE, SALARY, BONUS, TAX_PERCENTAGE)
VALUES
(101, 'Amit Sharma', 'Finance', 'amit.sharma@example.com', 9876543210, '2021-04-12', 65000, 5000, 10),
(102, 'Priya Verma', 'HR', 'priya.verma@example.com', 9123456780, '2020-11-08', 52000, 4000, 8),
(103, 'Rohan Mehta', 'IT', 'rohan.mehta@example.com', 9988776655, '2022-02-15', 78000, 6500, 12),
(104, 'Sneha Kapoor', 'Marketing', 'sneha.kapoor@example.com', 9090909090, '2019-06-01', 56000, 4500, 9),
(105, 'Vikas Gupta', 'Sales', 'vikas.gupta@example.com', 9876501234, '2023-01-10', 48000, 3500, 7),
(106, 'Anita Iyer', 'Operations', 'anita.iyer@example.com', 9765432109, '2020-09-25', 60000, 4800, 10),
(107, 'Karthik Reddy', 'IT', 'karthik.reddy@example.com', 9900112233, '2021-12-05', 82000, 7000, 12),
(108, 'Neha Patil', 'Finance', 'neha.patil@example.com', 9822011223, '2018-04-18', 70000, 5500, 10),
(109, 'Saurabh Singh', 'Admin', 'saurabh.singh@example.com', 9812233445, '2022-10-30', 45000, 3000, 6),
(110, 'Divya Nair', 'HR', 'divya.nair@example.com', 9034567812, '2019-08-20', 54000, 4200, 8);

SELECT * FROM employees;
-- Payroll Queries
-- a, Retrieve the list of employees sorted by salary in descending order
SELECT EMPLOYEE_ID, NAME, SALARY FROM employees ORDER BY SALARY desc;

-- b, Find employees with a total compensation greater than 6000
SELECT * FROM employees
WHERE (SALARY + BONUS) > 60000;

-- c, Update the bonus for employees in the Sales department by 10%
UPDATE employees
SET BONUS= BONUS *110/100
WHERE DEPARTMENT = 'Sales';
SELECT * FROM employees;

-- d, Calculate the net salary after deducting tax for all employees
SELECT EMPLOYEE_ID, NAME, DEPARTMENT,SALARY,
BONUS,TAX_PERCENTAGE,
(SALARY + BONUS - (SALARY * TAX_PERCENTAGE / 100)) AS net_salary
FROM employees;

-- e, Retrieve the average, minimum and maximum salary per department
SELECT DEPARTMENT,AVG(SALARY) as salary, MIN(SALARY) as minimum, MAX(SALARY) as maximum
FROM employees GROUP BY DEPARTMENT;

-- Advanced Queries
-- a, Retrieve employees who joined in the last 6 months
SELECT * FROM EMPLOYEES 
WHERE JOINING_DATE > CURRENT_DATE - INTERVAL '6 MONTHS';

-- b, Group employees by department and count how many employees each has
SELECT DEPARTMENT,COUNT(EMPLOYEE_ID) as total_number 
FROM employees GROUP BY DEPARTMENT;

-- c, Find the department with the highest salary
SELECT DEPARTMENT, AVG(SALARY) as average_salary
FROM employees GROUP BY DEPARTMENT ORDER BY average_salary desc
LIMIT 1;

-- d Identify employees who have the same salary as atleast one other employee
SELECT e1.*
FROM employees e1
JOIN employees e2
  ON e1.SALARY = e2.SALARY
 AND e1.EMPLOYEE_ID <> e2.EMPLOYEE_ID;

