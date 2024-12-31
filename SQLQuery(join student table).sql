use sivasakthi;

create table staff(st_id int primary key,st_name varchar(100),salary money);

insert into staff(st_id,st_name,salary)values(1,'sivakumar',30000)
insert into staff(st_id,st_name,salary)values(2,'ram',40000);
insert into staff(st_id,st_name,salary)values(3,'swetha',40000);
insert into staff(st_id,st_name,salary)values(4,'Arun',30000);


create table student(s_id int primary key , sname varchar(100), class varchar(100));


insert into student(s_id,sname,class)values(1,'prasath','BCA');
insert into student(s_id,sname,class)values(2,'viswa','BCA');
insert into student(s_id,sname,class)values(3,'rahul','MCA');
insert into student(s_id,sname,class)values(4,'premkumar','MCA');
insert into student(s_id,sname,class)values(5,'santosh','BCA');
insert into student(s_id,sname,class)values(6,'balaji','MCA');
insert into student(s_id,sname,class)values(7,'magesh','MCA');
insert into student(s_id,sname)values(8,'siva');
insert into student(s_id,sname,class)values(9,'sakthi','BCA');
insert into student(s_id,sname,class)values(10,'sriram','MCA');

update student set class='BCA' where s_id=8;

create table manage(s_id int ,st_id int,c_time time
foreign key (s_id)references student(s_id),
foreign key (st_id)references staff(st_id)
);

insert into manage(s_id,st_id,c_time)values (1,1,'10:00:00');
insert into manage(s_id,st_id,c_time)values (2,2,'11:00:00');
insert into manage(s_id,st_id,c_time)values (3,3,'12:00:00');
insert into manage(s_id,st_id,c_time)values (4,4,'01:00:00');
insert into manage(s_id,st_id,c_time)values (5,2,'02:00:00');
insert into manage(s_id,st_id,c_time)values (6,1,'02:00:00');
insert into manage(s_id,st_id,c_time)values (7,3,'03:00:00');

select*from manage;
select*from student;
select*from staff;

select student.s_id,student.sname , student.class 
from manage
inner join student on manage.s_id=student.s_id;

select student.s_id,student.sname , student.class ,staff.st_id,staff.st_name
from manage
inner join student on manage.s_id=student.s_id
inner join staff on manage.st_id=staff.st_id;

select student.s_id,student.sname , student.class ,staff.st_id,staff.st_name
from manage
inner join student on manage.s_id=student.s_id
inner join staff on manage.st_id=staff.st_id
where staff.st_id=2;




select student.s_id,student.sname,student.class
from student
left join manage on manage.s_id=student.s_id;

select student.s_id,student.sname,student.class,staff.st_id,staff.st_name,manage.c_time
from student
left join manage on manage.s_id=student.s_id
left join staff on manage.st_id=staff.st_id;

SELECT student.s_id, student.sname, student.class
FROM student
LEFT JOIN manage ON student.s_id = manage.s_id
WHERE manage.st_id IS NULL;

select staff.st_id,staff.st_name
from staff
right join manage on manage.st_id=staff.st_id;

select staff.st_id,staff.st_name,student.s_id,student.sname
from staff
right join manage on manage.st_id=staff.st_id
right join student on manage.s_id=student.s_id;

select student.sname,student.class,staff.st_name
from manage
full outer join student on student.s_id=manage.s_id
full outer join staff on staff.st_id=manage.st_id;















