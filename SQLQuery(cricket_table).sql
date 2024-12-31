 use siva;
  create table cricket(jersey_no int primary key,player_name varchar(100),age int,team varchar(100),runs int);
  select * from cricket;
  insert into cricket(jersey_no,player_name,age,team,runs)values(45,'rohit',35,'mi',4000)
  insert into cricket(jersey_no,player_name,age,team,runs)values(18,'virat',34,'RCB',4500)
  insert into cricket(jersey_no,player_name,age,team,runs)values(1,'rahul',31,'LSG',2800)
  insert into cricket(jersey_no,player_name,age,team,runs)values(23,'ashwin',36,'RR',1500)
  insert into cricket(jersey_no,player_name,age,team,runs)values(66,'sky',33,'mi',3000)
  insert into cricket(jersey_no,player_name,age,team,runs)values(7,'dhoni',40,'CSK',3500)
  insert into cricket(jersey_no,player_name,age,team,runs)values(55,'hardik',31,'csk',2100)
  insert into cricket(jersey_no,player_name,age,team,runs)values(44,'pant',28,'DC',2600)
   
  select * from cricket where age>31;
  select player_name,runs from cricket where team='mi';
  select sum(runs)[total_runs] from cricket where team='mi';
  select avg(runs)[avg runs] from cricket where team='mi';
  select avg(age)[avg age ] from cricket where team='csk'

  select * from cricket;

  exec sp_rename 'cricket.runs','ipl_total_runs','column';

  alter table cricket add season_2_runs int;

  update cricket set season_2_runs=382 where  jersey_no=7;

  update cricket set season_2_runs=ISNULL(season_2_runs,444);

 update cricket set ipl_total_runs=(select SUM(season_1_runs) from cricket where season_1_runs>500 )where jersey_no=1;

 update cricket set ipl_total_runs=(select max(season_2_runs)from cricket )where jersey_no=18;

 select avg(ipl_total_runs)[rohit avg_runs ],(select avg(ipl_total_runs)from cricket where player_name='rahul')[rahul avg_runs] from cricket where player_name='rohit';

 update cricket set ipl_total_runs=(select (season_1_runs + season_2_runs)from cricket where jersey_no=66)where jersey_no=66 ;

   select * from cricket;

   select * from cricket where player_name like '%vi%';

   select player_name , ipl_total_runs from cricket where ipl_total_runs between (select min(ipl_total_runs) from cricket where team='mi') and (select max(ipl_total_runs) from cricket where team='mi');

   select * from cricket where jersey_no between 10 and 50;

   select team from cricket where team in ( select team from cricket where player_name like 's%');

   select player_name , team from cricket where team in ('csk','mi');

   select ipl_total_runs , player_name from cricket where ipl_total_runs = (select max(ipl_total_runs)from  cricket where team in('rcb' ,'rr'));

   select player_name , age from cricket where age > (select min(age) from cricket where team in('mi','csk'));


   group by and having

1.Find the average runs scored by players in each team. Only include teams with an average run greater than 860
		
		select team,AVG(ipl_total_runs)as average_run from cricket 
		group by team
		having AVG(ipl_total_runs)>860;

2.Find teams where the total runs scored by players is between 800 and 1200.

		SELECT team, SUM(ipl_total_runs) AS total_runs
        FROM cricket
        GROUP BY team
        HAVING SUM(ipl_total_runs) BETWEEN 800 AND 1200;


