use hr;
select * from departments;
select * from countries;
select * from employees;
select * from jobs;
select * from locations;
select * from regions;

-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt
SELECT
	department_id,
    COUNT(*) AS employeescnt
FROM employees
GROUP BY department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt
SELECT
	departments.department_name,
    COUNT(*) AS employeescnt
FROM employees
JOIN departments ON departments.department_id = employees.department_id
GROUP BY employees.department_id;

-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt
SELECT
	manager_id,
    COUNT(*) AS employeescnt
FROM employees
GROUP BY manager_id;

-- Найти количество сотрудников у каждого менеджера. Вывести firstname, lastname и employees_cnt
SELECT
	first_name,
	last_name,
    COUNT(*) AS employeescnt
FROM employees
GROUP BY manager_id;

-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
SELECT
    department_id,
    MAX(salary) AS maxsalary
FROM employees
GROUP BY department_id;

-- Найти сотрудников, у которых наибольшая зарплата в их департаменте
SELECT
	employees.department_id,
	employees.first_name,
    employees.last_name,
    t1.maxsalary
FROM employees
JOIN (SELECT
    department_id,
    MAX(salary) AS maxsalary
FROM employees
GROUP BY department_id) t1 
ON t1.department_id = employees.department_id
WHERE t1.maxsalary = employees.salary;
    
-- Найти департаменты, в которых больше 10 сотрудников. Вывести department_name
SELECT
	departments.department_name,
    COUNT(*) AS employeescnt
FROM employees
JOIN departments ON departments.department_id = employees.department_id
GROUP BY employees.department_id
HAVING employeescnt > 10;