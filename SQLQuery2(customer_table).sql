
  use new1;
  select * from customer;
  select sum(SALARY) from customers where AGE>25;
  select sum(SALARY)[sum of salary] from customers where AGE>25;
  select AGE,SALARY from customers where AGE>25;
  select avg(age) from CUSTOMERS where salary>2000;

  create database siva;
 
  use siva;

 
  create table customer(customer_id int,salesman_id int,customer_name varchar(100),city varchar(50),grade int);
  select*from customer;
  insert into customer(customer_id,salesman_id,customer_name,city,grade)values(11,51,'rahul','New York',100);
  insert into customer(customer_id,salesman_id,customer_name,city,grade)values(12,52,'kumar','New York',200);
  insert into customer(customer_id,salesman_id,customer_name,city,grade)values(13,53,'prem','London',250);
  insert into customer(customer_id,salesman_id,customer_name,city,grade)values(14,54,'sriram','Paris',100);
  insert into customer(customer_id,salesman_id,customer_name,city,grade)values(15,55,'viswa','london',300);
  insert into customer(customer_id,salesman_id,customer_name,city,grade)values(16,56,'balaji','Moscow',400);
  insert into customer(customer_id,salesman_id,customer_name,city,grade)values(17,57,'magesh','new york',200);

  select*from customer where grade>100;
  select*from customer where city='new york' and grade>100;

  select * from customer;

  alter table customer add winner_or_lose varchar(100) ;

  update customer set winner_or_lose=isnull(winner_or_lose,'winner')where grade>200;
  update customer set winner_or_lose=isnull(winner_or_lose,'lose')where grade<201;
  
  ALTER TABLE customer
DROP COLUMN winner_or_lose;




 

  







