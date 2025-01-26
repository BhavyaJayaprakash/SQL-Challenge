-- Create Table Schema DB name Employees
-- Create titles table
CREATE TABLE titles(
    title_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE
);
--create employee table
CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(20) NOT NULL,
    birth_date TEXT NOT NULL, 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(1) CHECK (sex IN ('M','F')),
    hire_date TEXT,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--Create salaries table
CREATE TABLE salaries(
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create departments table
CREATE TABLE departments(
    dept_no VARCHAR(20) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE
);

--Create dept_manager table
CREATE TABLE dept_managers(
    dept_no VARCHAR(20),
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no,emp_no)
);

--Create dept_emp table
CREATE TABLE dept_emp(
    emp_no INT,
    dept_no VARCHAR(20),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no,dept_no)
);

-----------------------------------------------------------------------------------------------
--Imported CSV files and check if data is loaded in the tables
---------------------------------------------------------------------------------------------
-- Check that tables open properly
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_managers;
SELECT * FROM dept_emp; 

-----------------------------------------------------------------------------------------------
--Formatting the Birth_date and Hire_date in the employees table for visual importance 
---------------------------------------------------------------------------------------------

ALTER TABLE employees
ADD COLUMN hire_date_mmddyy DATE,
ADD COLUMN birth_date_mmddyy DATE;
UPDATE employees
SET hire_date_mmddyy = TO_DATE(hire_date, 'MM/DD/YYYY');
UPDATE employees
SET birth_date_mmddyy = TO_DATE(birth_date, 'MM/DD/YYYY');

-- Checking to see if dates were converted correctly
SELECT *
FROM employees;


