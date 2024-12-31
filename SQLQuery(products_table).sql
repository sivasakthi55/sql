use siva;
create table products(product_id int primary key,product_name varchar(100),category varchar(100),price money,stock int);
select*from products;
insert into products(product_id,product_name,category,price,stock)values(1,'laptop','electronics',1000,50);
insert into products(product_id,product_name,category,price,stock)values(2,'smartphones','electronics',700,150);
insert into products(product_id,product_name,category,price,stock)values(3,'washing machine','home appliance',500,30);
insert into products(product_id,product_name,category,price,stock)values(4,'refrigerator','home appliance',800,25);
insert into products(product_id,product_name,category,price,stock)values(5,'microwave','kitchen',200,40);
insert into products(product_id,product_name,category,price,stock)values(6,'blender','kitchen',100,60);

1. select * from products where price>(select avg(price) from products);

2. select product_name from products where category='home appliance' and  stock>(select avg(stock) from products where category='electronics');  

3. select * from products c1 where price=(select max(price) from products c2 where c1.category=c2.category);

4. select * from products where price<(select min(price)from products where category='electronics');

5. select product_name from products where price>(select min(price) from products where category='kitchen');

6. select * from products where price= (select max(price) from products where price<(select max(price) from products ));

7. select product_name from products c1 where stock=(select max(stock)from products c2 where  c1.category=c2.category);

8. select product_name from products where stock>(select avg(stock) from products where category!='electronic');

9. select product_name from products where category='kitchen' and price>(select avg(price) from products where category='home appliance');

10. select product_name from products where  price<(select max(price) from products where category='kitchen') and price>(select avg(price) from products);







