use siva;
create table student(s_id int primary key , sname varchar(100), class varchar(100),staff_id int);

insert into student(s_id,sname,class,staff_id)values(1,'prasath','BCA',1);
insert into student(s_id,sname,class,staff_id)values(2,'viswa','BCA',2);
insert into student(s_id,sname,class,staff_id)values(3,'rahul','MCA',1);
insert into student(s_id,sname,class,staff_id)values(4,'premkumar','MCA',3);
insert into student(s_id,sname,class,staff_id)values(5,'santosh','BCA',2);
insert into student(s_id,sname,class,staff_id)values(6,'balaji','MCA',3);
insert into student(s_id,sname,class,staff_id)values(7,'magesh','MCA',4);
insert into student(s_id,sname,class,staff_id)values(8,'siva','MCA',1);
insert into student(s_id,sname,class,staff_id)values(9,'sakthi','BCA',4);
insert into student(s_id,sname,class,staff_id)values(10,'sriram','MCA',2);

select * from student;

update student set class='MCA';

create table staff(st_id int primary key,st_name varchar(100),salary money);

insert into staff(st_id,st_name,salary)values(1,'sivakumar',30000)
insert into staff(st_id,st_name,salary)values(2,'ram',40000);
insert into staff(st_id,st_name,salary)values(3,'swetha',40000);
insert into staff(st_id,st_name,salary)values(4,'Arun',30000);

update staff set salary=50000 where st_id=3;

select * from staff;

select * from  student where staff_id=(select  st_id from staff where salary=(select max(salary)from staff));

select * from student where staff_id=(select st_id from staff where st_name='sivakumar');

SELECT * FROM student WHERE class = ( SELECT class  FROM student  WHERE staff_id = ( SELECT st_id FROM staff  WHERE st_name = 'sivakumar'));


select * from student where staff_id=(select st_id from staff where salary=(select max(salary) from staff where salary<(select max(salary)from staff)));

select * from student where staff_id=(select st_id from staff where salary>(select salary from staff where st_name='ram'));

select avg(salary)from staff where st_id in(select staff_id from student where class='MCA');

select * from staff where salary<(select avg(salary)from staff);

select * from  student where s_id between 4 and 9;

update student set class='BCA' where s_id between 6 and 9;

select * from student where  class in ('BCA','MCA');

select * from student where sname like 's%';

select * from student where sname like '%sa%';

select * from staff where salary not between 35000 and 45000;

select * from student where staff_id <>2;

select * from student where staff_id in(1,3,4);

select * from staff where st_name like '%ar';

select * from student where class<>'MCA';

select * from student where staff_id is null;

select * from student where staff_id in (select st_id from staff where salary between 35000 and 45000);

select * from student where staff_id in (select st_id from staff where salary in (30000,40000));

select * from student where staff_id in (select st_id from staff where st_name like 's%');

select * from student where staff_id in (select st_id from staff where salary > ( select salary from staff where st_name='ram'));

select * from staff where st_id in ( select staff_id from student where class='MCA');

select * from staff where st_id in ( select staff_id from student where s_id between 5 and 10 );

select * from student where staff_id in (select st_id from staff where salary not in (30000 , 40000));









