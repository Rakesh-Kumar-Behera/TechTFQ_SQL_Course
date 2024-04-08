-- ----------------------------- JOINS ------------------------------------
-- Type of JOINS
------------------------------
-- 1. INNER JOIN / JOIN
-- 2. LEFT OUTER JOIN / LEFT JOIN
-- 3. RIGHT OUTER JOIN / RIGHT JOIN
-- 4. FULL OUTER JOIN / FULL JOIN
-- 5. NATURAL JOIN
-- 6. CROSS JOIN
-- 7. SELF JOIN

/*
INNER JOIN --> Returns matching records from both table
LEFT JOIN - INNER JON + returns records present only in left table (based on the join condition)
RIGHT JOIN - INNER JON + returns records present only in right table (based on the join condition)
FULL JOIN - INNER JOIN + LEFT JOIN + RIGHT JOIN

*/
use Art;
select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

/*1) Fetch names of all the artists along with their painting name.
If an artist does not have a painting yet, display as "NA" */

select a.id, concat(a.first_name, '', a.last_name) as artist_name
,p.name as painting_name 
from artists a join paintings p on p.artist_id = a.id;


select a.id, concat(a.first_name, ' ', a.last_name) as artist_name, 
case when p.name is null then 'NA' 
else p.name 
end as painting_name
from artists a 
left join paintings p on p.artist_id = a.id;

-- Alternate way
-- coalesce function
select a.id, concat(a.first_name, '', a.last_name) as artist_name
,coalesce(p.name,'NA') as painting_name 
from artists a left join paintings p on p.artist_id = a.id;

-- ifnull() also works here in MySQL
select a.id, concat(a.first_name, '', a.last_name) as artist_name
,ifnull(p.name,'NA') as painting_name 
from artists a left join paintings p on p.artist_id = a.id;

-- coalesce() --> postgre SQL, MySQL, oracle, MSSQL
-- Oracle --> NVL, NVL2, Coalesce
-- MySQL --> ifnull()

-- 2) Find collectors who did not purchase any paintings
-- - using subQuery
select * from collectors
where id not in (select distinct collector_id from sales);

-- using left join
select C.* from collectors C 
left join sales S 
on C.id = S.collector_id
where S.collector_id is null;

-- using right join
select C.* from sales S 
right join collectors C 
on C.id = S.collector_id
where S.id is null;

-- 3) Find how much each artists made from sales and how many paintings did they sale.

select A.* , sum(S.sales_price) as total_sales,count(S.artist_id) as num_of_paintings
from Sales S 
join artists A on A.id = S.artist_id
group by S.artist_id;

-- for better performance, we can fetch only the required data instead of the whole table when dealing with big tables
select first_name, sum(S.sales_price) as total_sales,count(1) as num_of_paintings
from sales S
join (select id,first_name from artists) a 
on S.artist_id = a.id
group by first_name;

-- 4) Display all the available paintings and all the artists.if a painting was sold then mark them as "sold"
-- and if more than 1 painting of an artist was sold then display a "**" beside their name .

-- postgre solution
select * , case 
				when S.id is not null then "SOLD" end as sold_or_not 
from paintings P
full join artists A on P.artist_id = A.id
left join sales S on S.painting_id = P.id
-- ----------
select P.name as painting_name,concat(a.first_name," ",a.last_name , case when X.no_of_paintings > 1 then "**" end) as artist_name , 
			case
				when X.no_of_paintings > 1 then "Multiple sale" end temp,
			case 
				when S.id is not null then "SOLD" end as sold_or_not 
from paintings P
full join artists A on P.artist_id = A.id
left join sales S on S.painting_id = P.id
left join (select artist_id, count(1) as no_of_paintings
			from sales group by artist_id) X on X.artist_id = A.id




-- MySQL solution
-- full join is not available in MySQL so, FULL JOIN = LEFT JOIN +(UNION)+ RIGHT JOIN
select P.name as painting_name,concat(a.first_name," ",a.last_name ) as artist_name , 
			case
				when X.no_of_paintings > 1 then "Multiple sale" end as temp,
			case 
				when S.id is not null then "SOLD" end as sold_or_not
from paintings P
left join artists A on P.artist_id = A.id
left join sales S on S.painting_id = P.id
left join (select artist_id, count(1) as no_of_paintings
			from sales group by artist_id) X on X.artist_id = A.id
UNION
select P.name as painting_name,concat(a.first_name," ",a.last_name) as artist_name , 
			case
				when X.no_of_paintings > 1 then "Multiple sale" end as temp,
			case 
				when S.id is not null then "SOLD" end as sold_or_not
from paintings P
right join artists A on P.artist_id = A.id
left join sales S on S.painting_id = P.id
left join (select artist_id, count(1) as no_of_paintings
			from sales group by artist_id) X on X.artist_id = A.id
            
-- Adding " **"  -----> ,case when X.no_of_paintings > 1 then "**" end"

select P.name as painting_name,case 
			when X.no_of_paintings > 1 then concat(a.first_name," ",a.last_name," **") 
			else concat(a.first_name," ",a.last_name) end as artist_name , 
			case
				when X.no_of_paintings > 1 then "Multiple sale" end as temp,
			case 
				when S.id is not null then "SOLD" end as sold_or_not
from paintings P
left join artists A on P.artist_id = A.id
left join sales S on S.painting_id = P.id
left join (select artist_id, count(1) as no_of_paintings
			from sales group by artist_id) X on X.artist_id = A.id
UNION
select P.name as painting_name,case 
			when X.no_of_paintings > 1 then concat(a.first_name," ",a.last_name," **") 
			else concat(a.first_name," ",a.last_name) end as artist_name ,
            case
				when X.no_of_paintings > 1 then "Multiple sale" end as temp,
			case 
				when S.id is not null then "SOLD" end as sold_or_not
from paintings P
right join artists A on P.artist_id = A.id
left join sales S on S.painting_id = P.id
left join (select artist_id, count(1) as no_of_paintings
			from sales group by artist_id) X on X.artist_id = A.id
            
-- 5) Find how much each artists made from sales and how many paintings did they sale using NATURAL JOIN
-- using NATURAL JOIN - make sure there are at least one matching column in both the tables, column name also should match

select first_name,sum(sales_price), count(1)
from sales s
join artists a on a.id = s.artist_id
group by artist_id;

-- ----- using natural join  
select first_name,sum(sales_price), count(1)
from sales s
natural join artists a  -- No need to specify join condition
group by artist_id;
-- not a recommended approach

-- alter table artists rename column artist_id to id;

-- CROSS JOIN -> cartesian product - each record from table1 will match with all the records from table2
-- The CROSS JOIN keyword returns all matching records from both tables whether the other table matches or not.
-- 6) no joining condition required
select *
from sales s
cross join artists a ;

-- Thumb rule for CROSS JOIN
-- you can use a cross join, and if any one of the two tables has one record
select P.name as painting_name , a.first_name
from paintings p
cross join (select * from artists where first_name = "Kate") a;

-- NON ANSI way of joining table 
select * from paintings,sales; -- it also performs cross join

-- ANSI way of joining
select * from paintings ross join sales;

