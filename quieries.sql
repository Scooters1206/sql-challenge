CREATE TABLE employees (
	emp_no int NOT NULL,
	emp_title VARCHAR(30) NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE titles (
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE dept_employee (
	emp_no int NOT NULL,
	dept_no VARCHAR(30) NOT NULL
);

CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE salaries (
	emp_no int NOT NULL,
	salary int NOT NULL,
	PRIMARY KEY (emp_no)
);

ALTER TABLE titles
ADD FOREIGN KEY (title_id) REFERENCES employees(emp_title);

DROP TABLE employees CASCADE;
DROP TABLE titles CASCADE;
DROP TABLE dept_employee;
DROP TABLE salaries;
DROP TABLE departments CASCADE;
DROP TABLE dept_manager;

select * from dept_employee;

COPY dept_employee(emp_no,dept_no) FROM 'C:\Users\rpsii\Desktop\Bootcamp\Homework\sql-challenge\EmployeeSQL\data\dept_emp.csv' DELIMITER ',' CSV HEADER

select employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary 
from employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

select first_name, last_name, hire_date
from employees
where hire_date BETWEEN '1/1/1986' and '12/31/1986';

select dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
from ((dept_manager
inner join departments on
dept_manager.dept_no = departments.dept_no)
inner join employees on
dept_manager.emp_no = employees.emp_no);

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from ((employees
inner join dept_employee on
employees.emp_no = dept_employee.emp_no)
inner join departments on
dept_employee.dept_no = departments.dept_no);

select employees.first_name,
employees.last_name,
employees.sex
from employees
where first_name = 'Hercules' 
AND last_name ~ 'B';

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from ((employees
inner join dept_employee on
employees.emp_no = dept_employee.emp_no)
inner join departments on
dept_employee.dept_no = departments.dept_no)
where dept_name = 'Sales';

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from ((employees
inner join dept_employee on
employees.emp_no = dept_employee.emp_no)
inner join departments on
dept_employee.dept_no = departments.dept_no)
where dept_name = 'Sales'
or dept_name = 'Development';

select last_name, COUNT(last_name) as "Last Name Count"
from employees
group by last_name
order by "Last Name Count" desc;
