use SalesOrder;

select * from sales_order;
select * from products;
select * from customers;

-- WITH clause in SQL, Also referred  to as CTE (Common Table Expression)
-- if you have any subquery, then u can put that subquery inside a with clause and use it multiple times.
-- make your query cleaner , more readable and improve performance

-- 1) Find the most profitable orders. Most profitable orders are those 
-- whose sale price exceeded the average sale price for each city and whose deal size was not small

-- average sale price for each city
select C.city, avg(S.sales)
from sales_order S
join customers C
on C.customer_id = S.customer
group by C.city;

-- average sale price for each city --- using CTE clause
with cte as
			(select C.city, avg(S.sales)
			from sales_order S
			join customers C
			on C.customer_id = S.customer
			group by C.city)
select * from cte;

-- giving a meaningful name
with avg_sales_per_city as
			(select C.city, avg(S.sales)
			from sales_order S
			join customers C
			on C.customer_id = S.customer
			group by C.city)
select * from avg_sales_per_city;

-- Solution using CTE 

with avg_sales_per_city as
			(select C.city, avg(S.sales) as avg_sales
			from sales_order S
			join customers C
			on C.customer_id = S.customer
			group by C.city)
select *
from sales_order s
join customers c on C.customer_id = S.customer
join avg_sales_per_city av on c.city = av.city
where s.sales > av.avg_sales
and s.deal_size <> "Small";
                    
-- using subquery
select *
from sales_order s
join customers c on C.customer_id = S.customer
where s.sales > (select avg(avg_sales) from (select avg(S.sales) avg_sales
			from sales_order S
			join customers C
			on C.customer_id = S.customer
			group by C.city) X ) 
and s.deal_size <> "Small";

-- -------------- or ----------
select S.*
from sales_order s
join customers c on c.customer_id = s.customer
where s.sales > (select avg(S2.sales) avg_sales
			from sales_order S2
			join customers C2
			on C2.customer_id = S2.customer
            where c.city = C2.city
			group by c.city) 
and s.deal_size <> "Small";
					

-- 2) Find the difference in average sales for each month of 2003 and 2004

-- Avg sales for each month of 2023
with yr_2003 as
			(select year_id,monthname(order_date) month_name,avg(sales) avg_sales
			from sales_order
			where year_id = 2003
			group by year_id,monthname(order_date)
			order by month_id),
	yr_2004 as
			(select year_id,monthname(order_date) month_name,avg(sales) avg_sales
			from sales_order
			where year_id = 2004
			group by year_id,monthname(order_date)
			order by month_id)
select y3.month_name, abs(y3.avg_sales - y4.avg_sales) as diff
from yr_2003 y3
join yr_2004 y4 on y3.month_name = y4.month_name;

