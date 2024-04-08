create database Art;
use Art;

select * from paintings;
select * from artists;
select * from collectors;
select * from sales;


drop table paintings;
drop table artists;
drop table collectors;
drop table sales;


create table paintings
(
    id              int,
    name            varchar(40),
    artist_id       int,
    listed_price    float
);

create table artists
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table collectors
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table sales
(
    id                  int,
    sale_date           date,
    painting_id         int,
    artist_id           int,
    collector_id        int,
    sales_price         float
);


insert into paintings values (11,'Miracle',1,300);
insert into paintings values (12,'Sunshine',1,700);
insert into paintings values (13,'Pretty woman',2,2800);
insert into paintings values (14,'Handsome man',2,2300);
insert into paintings values (15,'Barbie',3,250);
insert into paintings values (16,'Cool painting',3,5000);
insert into paintings values (17,'Black square #1000',3,50);
insert into paintings values (18,'Mountains',4,1300);
insert into paintings values (19,'Sunset',10,2300);
insert into paintings values (20,'Sea Front',11,1600);

insert into artists values (1,'Thomas','Black');
insert into artists values (2,'Kate','Smith');
insert into artists values (3,'Natali','Wein');
insert into artists values (4,'Francesco','Benelli');
insert into artists values (5,'Nicholas','Smith');
insert into artists values (6,'Peri','Hoon');

insert into collectors values (101,'Brandon','Cooper');
insert into collectors values (102,'Laura','Fisher');
insert into collectors values (103,'Christina','Buffet');
insert into collectors values (104,'Steve','Stevenson');

insert into sales values (1001,'2021-11-01',13,2,104,2500);
insert into sales values (1002,'2021-11-10',14,2,102,2300);
insert into sales values (1003,'2021-11-10',11,1,102,300);
insert into sales values (1004,'2021-11-15',16,3,103,4000);
insert into sales values (1005,'2021-11-22',15,3,103,200);
insert into sales values (1006,'2021-11-22',17,3,103,50);

select * from paintings;
select * from artists;
select * from collectors;
select * from sales;


-- Subquery 
-- ----------------------------------

-- 1) Fetch paintings that are priced higher than the average painting price
select *
from paintings 
where listed_price > (select avg(listed_price) from paintings);

-- 2) Fetch all collectors who purchased paintings
select * from collectors
where id in (select distinct(collector_id) from sales);

-- Using JOINS
select distinct C.* 
from collectors C 
join sales S on C.id = S.collector_id;

-- 3) Fetch the total amount of sales for each artist who has sold at least one painting
-- Display artist name and total sales amount

select A.*,sum(S.sales_price)
from artists A 
join sales S on S.artist_id = A.id
group by S.artist_id
having count(S.artist_id) >= 1;

select * 
from artists a
join
(select artist_id, sum(sales_price) total_amt
from sales 
group by artist_id) x
on x.artist_id = a.id;

-- 4) Fetch the total amount of sales for each artist who has sold either 1 or 2 paintings only
-- Display also the no of paintings sold

select * 
from artists a
join
(select artist_id, sum(sales_price) total_amt , count(1)  paintings_sold
from sales 
group by artist_id
having count(artist_id) in (1,2) ) x
on x.artist_id = a.id;

select A.*,sum(S.sales_price),count(1)  paintings_sold
from artists A 
join sales S on S.artist_id = A.id
group by S.artist_id
having count(S.artist_id) in (1,2);

-- 5) Find the artists who had zero sales
select * from artists
where id not in (select distinct artist_id from sales);

-- Using Not Exists
select * from artists A
where not exists(select 1 from sales S
				where S.artist_id = A.id);
                
-- 6) write a query to identify duplicate records
insert into artists values (5,'Natali','Wein');
insert into artists values (6,'Francesco','Benelli');

-- using group by
select first_name, last_name , count(1)
from artists
group by first_name, last_name
having count(1) > 1;

-- Assignment - how would you delete the duplicate records in the artists table
select * from artists;

select first_name,last_name,count(1),max(id)
from artists
group by first_name,last_name
having count(1) > 1;

select max(id)
from artists
group by first_name,last_name
having count(1) > 1;

-- Solution

-- Postgre SQL solution
delete from artists
where ctid in (
			select max(ctid)
			from artists
			group by first_name,last_name
			having count(1) > 1);
            
-- if multiple duplicate records then use the below query
delete from artists
where ctid not in (
			select min(ctid)
			from artists
			group by first_name,last_name
			);
            
delete from artists
where id in (
			select max(id)
			from artists
			group by first_name,last_name
			having count(1) > 1); -- This query works if the table already has a unique column, like id in this case

-- Oracle solution
 delete from artists
where rowid in (
			select max(rowid)
			from artists
			group by first_name,last_name
			having count(1) > 1);
            
-- MySQL solution
-- using self-join
delete a from artists a
join artists b
where a.id > b.id
and a.first_name = b.first_name
and a.last_name = b.last_name;

select * from artists;

-- using window function
select *
, row_number() over() as single_part
, row_number() over(partition by first_name order by first_name) as rn_with_partition
from artists;

select *
, row_number() over(partition by first_name,last_name) as rn
from artists;

select * from
			(select *
			, row_number() over(partition by first_name,last_name) as rn
			from artists) x
            where rn > 1;
            
delete from artists
where id in (select id from
			(select *
			, row_number() over(partition by first_name,last_name) as rn
			from artists) x
            where rn > 1);



-- Imagine a table with 1M records and 10k duplicate records. How to delete faster?
insert into artists values (2, 'Kate', 'Smith');
insert into artists values (3, 'Natali', 'Wein');

-- Option 1

-- Main table
select * from artists; -- 6 records
select * from artists_bkp; -- 4 records

-- create a back up table with all the unique values
create table artists_bkp as
select distinct * from artists;

-- truncate the main table
truncate table artists;

-- insert the data from back up table to the main table
insert into artists
select * from artists_bkp;

-- drop the back up table
drop table artists_bkp;

-- Option 2  -- Not recommended by Production or dev env
create table artists_bkp as
select distinct * from artists;

drop table artists;

alter table artists_bkp rename to artists;