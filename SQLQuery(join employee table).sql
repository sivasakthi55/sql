use sivasakthi;

create table employee(emp_id int , emp_name varchar(100),emp_salary money,dep_id int , manager_id int);

insert into employee(emp_id,emp_name,emp_salary,dep_id,manager_id)values(11,'prasath',30000,1,100);
insert into employee(emp_id,emp_name,emp_salary,dep_id,manager_id)values(12,'kumar',35000,1,100);
insert into employee(emp_id,emp_name,emp_salary,dep_id,manager_id)values(13,'prem',20000,2,101);
insert into employee(emp_id,emp_name,emp_salary,dep_id,manager_id)values(14,'ram',25000,2,101);
insert into employee(emp_id,emp_name,emp_salary,dep_id,manager_id)values(15,'viswa',40000,3,103);
insert into employee(emp_id,emp_name,emp_salary,dep_id,manager_id)values(16,'harish',33000,3,103);

select * from employee;

create table departments(dept_id int,dept_name varchar(100));

insert into departments(dept_id,dept_name)values(1,'Marketing');
insert into departments(dept_id,dept_name)values(2,'Support');
insert into departments(dept_id,dept_name)values(3,'developer');

select * from departments;

CREATE TABLE managers (manager_id int,manager_name varchar(100),dept_id int);

insert into managers values (100, 'siva', 1);
insert into managers values (101, 'arun', 2);
insert into managers values (103, 'sriram', 3);

select * from managers;

CREATE TABLE projects (project_id int,project_name varchar(100),emp_id int);

INSERT INTO projects VALUES (22, 'bank App', 15);
INSERT INTO projects VALUES (22, 'bank App', 11);
INSERT INTO projects VALUES (24, 'cooking website', 16);
INSERT INTO projects VALUES (24, 'cooking website', 14);

select * from projects ;

select employee.emp_id,employee.emp_name,departments.dept_name,managers.manager_name
from employee
inner join departments on departments.dept_id=employee.dep_id
inner join managers on managers.dept_id=employee.dep_id;

select projects.project_id, projects.project_name,employee.emp_id,employee.emp_name
from projects
inner join employee on projects.emp_id=employee.emp_id;

select employee.emp_id,employee.emp_name,departments.dept_id,departments.dept_name
from employee
inner join departments on departments.dept_id=employee.dep_id;

select managers.manager_id , managers.manager_name,departments.dept_name
from managers
inner join departments  on departments.dept_id=managers.dept_id;

select projects.project_id,projects.project_name,employee.emp_name,departments.dept_name,managers.manager_name
from projects
inner join employee on employee.emp_id=projects.emp_id
inner join departments on departments.dept_id=employee.dep_id
inner join managers on managers.manager_id=employee.manager_id;

Retrieve Employees Without a Project Assigned

SELECT e.emp_id, e.emp_name, d.dept_name
FROM employee e
INNER JOIN departments d ON e.dep_id = d.dept_id
LEFT JOIN projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

1. Retrieve All Employees with Their Departments (Including Employees Without a Department)

select employee.emp_id,employee.emp_name,departments.dept_name
from employee
left join departments on departments.dept_id=employee.dep_id;

2. Retrieve All Employees with Their Managers (Including Employees Without a Manager)

SELECT e.emp_id, e.emp_name, e.emp_salary, m.manager_name
FROM employee e
LEFT JOIN managers m ON e.manager_id = m.manager_id;


3. Retrieve All Projects with Assigned Employees (Including Projects Without Employees)

SELECT p.project_id, p.project_name, e.emp_name
FROM projects p
LEFT JOIN employee e ON p.emp_id = e.emp_id;

4. Retrieve All Employees and Their Projects (Including Employees Not Assigned to Any Project)

select employee.emp_id,employee.emp_name, projects.project_name
from employee
left join projects on projects.emp_id=employee.emp_id;

5.Retrieve Employees Not Assigned to Any Project

select employee.emp_id,employee.emp_name
from employee 
left join projects on employee.emp_id=projects.emp_id
where projects.emp_id is null;


select * from employee;
select * from managers;
select * from departments;
select * from projects;

having and case: 

1.find departments where the average salary of employees is greater than 30,000.
		
		select dept_name , AVG(emp_salary)as average_salary from employee e
		join departments d on d.dept_id=e.dep_id
		group by d.dept_name
		having AVG(e.emp_salary)>30000;

2.If you want to add a column showing if an employee earns above or below 30,000 salary, you can use CASE

		
	select emp_name,emp_salary ,
		case
		  when emp_salary>30000 then 'above 30k'
		  else 'below 30k'
		end as salary_caterogy
	from employee;

3.If you want to filter departments based on the number of employees earning above a certain threshold (e.g., 30,000), you can combine HAVING with CASE.

		SELECT d.dept_name, 
	    COUNT(CASE WHEN e.emp_salary > 30000 THEN 1 END) AS num_high_salary_employees
		FROM employee e
		JOIN departments d ON e.dep_id = d.dept_id
		GROUP BY d.dept_name
		HAVING COUNT(CASE WHEN e.emp_salary > 30000 THEN 1 END) > 1;
