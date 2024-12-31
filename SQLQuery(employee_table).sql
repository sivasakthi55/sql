use siva;
create table employee(employee_id int primary key,empolyee_name varchar(100),age int,department varchar(100),salary money);
select*from employee;
insert into employee (employee_id,empolyee_name,age,department,salary)values(1,'john',25,'IT',50000);
insert into employee (employee_id,empolyee_name,age,department,salary)values(2,'sarah',28,'HR',60000);
insert into employee (employee_id,empolyee_name,age,department,salary)values(3,'mike',30,'IT',55000);
insert into employee (employee_id,empolyee_name,age,department,salary)values(4,'Emma',22,'sales',45000);
insert into employee (employee_id,empolyee_name,age,department,salary)values(5,'paul',29,'IT',70000);
insert into employee (employee_id,empolyee_name,age,department,salary)values(6,'jane',35,'HR',65000);

select max(salary) from employee;

SELECT EmployeeName, Department, Salary
FROM Employees e1
WHERE Salary = (SELECT MAX(Salary)
                FROM Employees e2
                WHERE e1.Department = e2.Department);

select max(salary) from employee ;
select * from employee e1 where salary=(select max(salary) from employee e2 where e1.department =e2.department)

select*from employee where salary>(select avg(salary) from employee);

select*from employee where salary > (select max(salary)from employee where department='sales');
select*from employee where age<(select max(age)from employee where department='HR');
select*from employee where salary=(select max(salary)from employee where salary<(select max(salary)from employee));