use sivasakthi;
create table functions(names varchar(100),age int,floatvalues float);

insert into functions(names,age,floatvalues)values
('prasath',21,12.124),
('viswa',22,6598.01),
('siva kumar',23,-0.01),
('santosh',24,12.33),
('prem',25,-21.323);
alter table functions add floatvalues float;
select * from functions;

1.text functions

select LEN(names) from functions where age=22;

select UPPER(names) from functions where age=23;

select LOWER(names) from functions where age=25;

select TRIM(names) from functions where age=25;

select concat(names,'.s') from  functions where age =25;

select SUBSTRING(names,1,1)from functions where age=25;

select REPLACE (names,'kumar','sakthi')from functions where age=25;

select CHARINDEX('kumar',names) from functions where age=25;

select LEFT(names,3)from functions where age=23;

select RIGHT(names,2)from functions where age=23;

select * from functions;

2.Number function

select ROUND(floatvalues,2)from functions where age=21;

select ceiling(floatvalues) from functions where age=22;

select FLOOR(floatvalues)from functions where age=24;

select ABS(floatvalues)from functions where age=23;

select POWER(age,3)from functions where age=21;

select SQRT(age)from functions where age=23;

select RAND() ;

select SIGN(floatvalues)from functions where age=21;
select SIGN(floatvalues)from functions where age=23;

 div
select 323/2 ;
mod

select 10%2;

3.date function

select GETDATE();

select DATEADD(day,4,'2024-04-02')

select DATEDIFF(day,'2024-12-04','2024-12-09');

select YEAR('2025-2-22');

select month('2025-2-22')

select day('2025-2-22')

select GETUTCDATE()

SELECT FORMAT('2024-11-10', 'yyyy-MM-dd') AS FormattedDate;

SELECT DATEPART(MONTH, '2024-11-10') 

SELECT EOMONTH('2024-11-10') 

select SUBSTRING(names,1,1)from functions;

 select names from functions where names like's%' and age>23;