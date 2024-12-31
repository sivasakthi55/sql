  use siva;
  
  create table orders(ord_no int,purch_amt money,order_date date,customer_id int,salesman_id int);
  select*from orders;
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(123,1544,'2012-10-05',21,5004);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(1214,1124,'2012-09-10',22,5015);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(1223,154,'2012-10-05',23,5006);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(1248,1254,'2012-09-10',31,6504);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(12,154,'2012-8-05',021,5258);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(125,1456,'2012-09-10',256,5056);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(859,895,'2012-06-06',89,8514);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(853,12365,'2012-09-10',789,4569);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(453,1765,'2012-04-10',79,4569);
  insert into orders(ord_no,purch_amt,order_date,customer_id,salesman_id)values(353,1165,'2012-09-10',89,4569);

  select * from orders where order_date='2012-09-10'and (salesman_id>5005 or purch_amt>1000);
  
  select COUNT(ord_no) from orders where order_date='2012-09-10' ;
  select COUNT(ord_no) from orders where salesman_id=4569;
  select COUNT(ord_no) from orders where salesman_id=4569 and order_date='2012-09-10';
  select MAX(purch_amt) from orders;
  select MIN(purch_amt) from orders;
  select sum(purch_amt) from orders;
  select AVG(purch_amt) from orders;
  select sum(purch_amt) from orders where order_date='2012-09-10';
  select avg(purch_amt) from orders where order_date='2012-09-10';
  select CONCAT(customer_id,'   ',salesman_id)['custo_id and saleman_id]from orders where purch_amt>1500;