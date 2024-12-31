use siva;
create table bike(bike_name varchar(100),bike_brand varchar(100),engine_cc int,tyre_brands varchar(100),price money,order_date date,shop_location varchar(100));

select*from bike;

insert into bike(bike_name,bike_brand,engine_cc,tyre_brands,price,order_date,shop_location)values('R15','yamaha',150,'MRF',200000,'02-06-2024','mayiladuthurai');
insert into bike(bike_name,bike_brand,engine_cc,tyre_brands,price,order_date,shop_location)values('MT15','yamaha',150,'MRF',215000,'09-07-2024','chennai');
insert into bike(bike_name,bike_brand,engine_cc,tyre_brands,price,order_date,shop_location)values('NS200','Pulsar',200,'ceat',250000,'05-08-2024','mayiladuthurai');
insert into bike(bike_name,bike_brand,engine_cc,tyre_brands,price,order_date,shop_location)values('rider','TVS',120,'ceat',100000,'08-08-2024','chennai');
insert into bike(bike_name,bike_brand,engine_cc,tyre_brands,price,order_date,shop_location)values('Rx100','yamaha',120,'ceat',110000,'06-07-2024','chennai');
insert into bike(bike_name,bike_brand,engine_cc,tyre_brands,price,order_date,shop_location)values('Bullet','Royal Enfield',350,'MRF',230000,'12-05-2024','mayiladuthurai');
insert into bike(bike_name,bike_brand,engine_cc,tyre_brands,price,order_date,shop_location)values('Splendor','hero',120,'MRF',90000,'2024-06-22','mayiladuthurai');

select avg(engine_cc)[avg of cc mrf], (select avg(engine_cc)[avg of cc] from bike where tyre_brands='ceat')[avg of ceat] from bike where tyre_brands='MRF';

select*from bike;

select sum(price)[sum of yamaha],(select sum(price)from bike where bike_brand='tvs')[sum of tvs]from bike where bike_brand='yamaha';
select sum(price)[sum of yamaha price],(select avg(price)from bike where bike_brand='yamaha')[avg of yamaha price]from bike where bike_brand='yamaha';

select count(order_date)[no of order chennai],(select count(order_date)from bike where shop_location='mayiladuthurai')[no of ord mayiladuthurai]from bike where shop_location='chennai';

select avg(price)[avg price of 150cc],(select avg(price)from bike where engine_cc=120)[avg price of 120cc]from bike where engine_cc=150;

update bike set tyre_brands='ceat' where bike_name='splendor';

select*from bike;

select * from bike where price > (select  avg(price) from bike where tyre_brands='mrf');

select bike_name ,engine_cc from bike where engine_cc between(select min(engine_cc) from bike where bike_brand='yamaha')and (select max(engine_cc) from bike where bike_brand='yamaha');

select bike_name,bike_brand from bike where price in (select price from bike where shop_location in('mayiladuthurai','chennai'));

select bike_name,engine_cc from bike where engine_cc in (select engine_cc from bike where bike_brand='TVS');

select * from bike where tyre_brands='MRF' and engine_cc > (select avg(engine_cc) from bike where tyre_brands='ceat');

1.Count the Number of Bikes by Brand
		
		select bike_brand,COUNT(bike_name) as total_bike from bike group by bike_brand;

2.Total Price of Bikes Sold by Location

		select shop_location ,SUM(price)as total_price from bike group by shop_location;

3.Average Engine CC by Tyre Brand

		select tyre_brands,AVG(engine_cc)as avg_engine_cc from bike group by tyre_brands;

4.Count Bikes by Engine CC Range

		select engine_cc,COUNT(bike_name)as no_of_bikes from bike group by engine_cc;

5.List All Bikes Ordered by Price in Ascending Order

		select bike_name,price from bike order by price ASC;

6.List All Bikes Ordered by Engine CC in Descending Order

		select bike_name,engine_cc from bike order by engine_cc desc;

7.List Bikes Sold Ordered by Date

		select bike_name,order_date  from bike order by order_date asc;

8.Count Bikes by Shop Location and Order by Count Descending
 
		select shop_location,COUNT(bike_name)as no_of_bikes from bike group by shop_location order by no_of_bikes desc;

9.Sum of Prices by Brand, Ordered by Total Price Descending

		select bike_brand,SUM(price)as total_price from bike group by bike_brand order by total_price desc;

10.Average Price of Bikes by Tyre Brand, Ordered by Price in Ascending Order

		select tyre_brands,AVG(price)as avg_price from bike group by tyre_brands order by avg_price asc;

11.Get the Maximum Price for Each Bike Brand Ordered by Price Descending
		
		select bike_brand,MAX(price)as maximum_price from bike group by bike_brand order by maximum_price desc;