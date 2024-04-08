use SalesOrder;

-- 1) Find the average sales order price based on deal size 
select * from sales_order;
select * from products;


select deal_size,round(avg(sales),2)
from sales_order
group by deal_size;

-- 2) Find total number of orders per each day.Sort data based on highest orders.  
select order_date,count(1) as num_order
from sales_order
group by order_date
order by num_order desc;

-- 3) Display total sales figure for each quarter, Represent each quarter with their respective period.
select case 
		when qtr_id = 1 then 'Q1 - Jan-Mar'
        when qtr_id = 2 then 'Q2 - Apr-Jun'
        when qtr_id = 3 then 'Q3 - Jul-Sep'
        else 'Q4 - Oct-Dec'
        end as quarter , round(sum(sales),2) as total_sales
from sales_order
group by qtr_id;
        

-- 4) Identify how many cars,motor cycles, trains and ships are available in the inventory,
-- Treat all type of cars as just "Cars"


select count(1)
from products
where product_line in ('Classic Cars','Vintage Cars','Motorcycles','Trains','Ships');


select product_line, count(1)
from products
where product_line in ('Classic Cars','Vintage Cars','Motorcycles','Trains','Ships')
group by product_line;

-- Solution 1

select case
       when product_line in ("Classic Cars" ,"Vintage Cars") then "Cars"
       else product_line
       end as product_lines
       , count(1)
from products
where product_line in ('Classic Cars','Vintage Cars','Motorcycles','Trains','Ships')
group by product_lines;

-- -------------------      or      ------------------------------------------
-- Solution 2 - subquery

select product_line,count(1)
from  (select case
       when product_line in ("Classic Cars" ,"Vintage Cars") then "Cars"
       else product_line
       end as product_line
from products
where product_line in ('Classic Cars','Vintage Cars','Motorcycles','Trains','Ships') ) x
group by product_line;

-- Solution 3  --- using UNION - no. of columns and datatypes of columns in both the table should match

select product_line,count(1)
from products
where product_line in ('Motorcycles','Trains','Ships') 
group by product_line
union
select "Cars" as product_line ,count(1)
from products
where product_line in ('Classic Cars','Vintage Cars');



-- 5) Identify the vehicles in the inventory which are short in number.
-- Shortage of vehicke is considered when there are less than 10 vehicles.

select product_line, count(product_line) as product_count
from products
group by product_line
having product_count < 10;


-- Assignments:
-- 6) Find the countries which have purchased more than 10 motorcycles. 
select * from customers;
select * from sales_order;
select * from products;

select country, count(country)
from customers C
join sales_order S on C.customer_id = S.customer
join products P on S.product = P.product_code
where P.product_line = "Motorcycles"
group by C.country
having count(country) > 10;

-- 7) Find the orders where the sales amount is incorrect.
select * from sales_order
where round(quantity_ordered * price_each,2) <> sales;

-- 8) Fetch the total sales done for each day.
select order_date,round(sum(sales),2)
from sales_order
group by order_date;

-- 9) Fetch the top 3 months which have been doing the lowest sales.
select month_id,round(sum(sales),2) as monthly_sales
from sales_order
group by month_id
order by monthly_sales
limit 3;












