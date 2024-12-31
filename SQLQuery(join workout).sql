use sivasakthi;

create table usertable(userid int primary key,username varchar(100));

insert into usertable (userid,username)values(1,'prasath');
insert into usertable (userid,username)values(2,'kumar');
insert into usertable (userid,username)values(3,'rahul');
insert into usertable (userid,username)values(4,'siva');
insert into usertable (userid,username)values(5,'prem');
insert into usertable (userid,username)values(6,'santhosh');
insert into usertable (userid,username)values(7,'hari');

select*from usertable;

create table sale(salesid int primary key,userid int,price money,

);

drop table sale;


insert into sale(salesid,userid,price)values(1,1,5000);
insert into sale(salesid,userid,price)values(2,2,4400);
insert into sale(salesid,userid,price)values(6,10,3300);
insert into sale(salesid,userid,price)values(7,9,8000);
insert into sale(salesid,userid,price)values(8,8,11000);


select*from sale;

select sale.salesid,usertable.username,sale.price 
from sale
inner join usertable on usertable.userid=sale.userid;

select usertable.userid,usertable.username,sale.salesid,sale.price
from usertable
left join sale on sale.userid=usertable.userid;

select sale.salesid, sale.price, usertable.userid , usertable.username
from usertable
right join sale on sale.userid=usertable.userid;

select usertable.userid,usertable.username,sale.salesid,sale.price
from sale
full outer join usertable on usertable.userid=sale.userid;











