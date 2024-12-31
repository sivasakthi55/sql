  use siva;
 create table student_table(reg_no bigint ,student_name varchar(100),join_date date,total_mark int,average float,phone_no char(10),fees_payment money);

  select*from student_table;

  insert into student_table(reg_no,student_name,join_date,total_mark,average,phone_no,fees_payment)values(1,'prasath','2024-10-02',254,51.25,'1234567890',45000);
  insert into student_table(reg_no,student_name,join_date,total_mark,average,phone_no,fees_payment)values(1,'viswa','2024-10-03',426,74.25,'7412589633',45000);
  insert into student_table(reg_no,student_name,join_date,total_mark,average,phone_no,fees_payment)values(3,'siva','2024-10-04',526,84.25,'8412589653',25000);
  insert into student_table(reg_no,student_name,join_date,total_mark,average,phone_no,fees_payment)values(4,'kumar','2024-10-05',526,85.25,'7412589553',25000);
  insert into student_table(reg_no,student_name,join_date,total_mark,average,phone_no)values(4,'rahul','2024-10-06',426,75.25,'9412589553');
  insert into student_table(reg_no,student_name,join_date,total_mark,average,phone_no,fees_payment)values(6,'prem','2024-10-06',326,65.25,'7892589553',22000);

  select * from student_table where total_mark>300;
  select * from student_table where fees_payment>22500; 
  select total_mark from student_table where student_name='kumar';
  select sum(fees_payment)['total fees']from student_table;
  select avg(fees_payment)['average fees']from student_table;
  select max(fees_payment)['average fees']from student_table;
  select min(fees_payment)['average fees']from student_table;
  select count(fees_payment)['average fees']from student_table;
  select concat(fees_payment,' ',reg_no)['average fees']from student_table;

  alter table student_table add department varchar(100);

  alter table student_table ALTER column reg_no smallint;

  

  EXEC sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';

  EXEC sp_rename 'student_table.total_mark', '12th_mark', 'COLUMN';

  insert into student_table(department)values('MCA');

  UPDATE student_table SET department = ISNULL(department, 'MCA');
select * from student_table;

update student_table set department='MCA' WHERE reg_no=3;
update student_table set average=(select AVG(average) from student_table where fees_payment>40000) where reg_no=4;

update student_table set fees_payment=45000 where student_name='rahul';
update student_table set reg_no=2 where student_name='viswa';
update student_table set reg_no=5 where student_name='rahul';


update student_table set average=(select AVG(average) from student_table where fees_payment>40000) where reg_no=4;


select * from student_table
select student_name,12th_mark,
case
  when average >= 90 then 'A+'
  when average >=80 then 'A'
  when average >= 70 then 'B+'
  when average >= 60 then 'B'
  when average >=50 then 'c'
  else 'f'
end as grade 
from student_table;


UPDATE student_table
SET fees_payment = 
    CASE 
        WHEN fees_payment = 0 THEN 25000  -- Set default payment for unpaid students
        ELSE fees_payment
    END;

