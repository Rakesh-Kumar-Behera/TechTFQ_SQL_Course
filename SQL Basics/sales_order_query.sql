select * from products;
select * from Customers;
select * from sales_order;

-- 1) Fetch all the small shipped orders from august 2003 till the end of year 2003
SELECT * 
FROM sales_order 
where deal_size = "small"
and year_id = 2003 and (month_id between 8 and 12); 

-- 2) Find all the orders which do not belong to customers from USA and are still in Process
select *
from sales_order S
join Customers C
on S.customer = C.customer_id
where C.country <> "USA" and S.status = "In Process";

-- Assignents for Session 6:
-- 3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
select * from sales_order S
join products P on S.product = P.product_code
where P.PRODUCT_LINE in ("Planes","Ships" , "Trains")
and S.status not in ("Shipped","In Process","Resolved");

-- 4) Find customers whose phone number has either parenthesis "()" or a plus sign "+"
select * from customers
where phone like "%+%" or phone like "%(%)%";

-- 5) Find customers whose phone number does not have any space.
select * from customers
where phone not like "% %";

-- 6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
SELECT * 
FROM sales_order 
where quantity_ordered % 2 = 0
and year_id = 2003 and (month_id between 2 and 5); 

-- 7) Find orders which sold the product for price higher than its original price.
select * from sales_order S
join products P on P.product_code = S.Product
and S.price_each > P.price;

-- 8) Find the average sales order price
select AVG(sales) as avg_order_price
from sales_order;

-- 9) Count total no of orders.
select count(1) from sales_order;

-- 10) Find the total quantity sold.
select sum(quantity_ordered) as total_qty from sales_order;

-- 11) Fetch the first order date and the last order date
select min(order_date) as first_order_date,max(order_date) as last_order_date from sales_order;

-- Group By & Having Clause
select * from sales_order;
select * from products;
select * from customers;

select PRODUCT_LINE
from products
GROUP BY product_line;

select distinct product_line from products;

-- count the number of records in each group
select product_line, count(product_line)
from products
GROUP BY product_line;

-- fetch all product_line vehicle categories which has more than 20 vehicles under them
select product_line, count(1) as vehicle_count
from products
GROUP BY product_line
having count(PRODUCT_LINE) > 20;

-- fetch all product_line vehicle categories which has less than 20 vehicles under them & do not consider trains

select product_line, count(product_line) as vehicle_count
from products
GROUP BY product_line
having count(product_line) < 20 and PRODUCT_LINE <> "Trains";

select product_line, count(PRODUCT_LINE) as vehicle_count  --3
from products --1
where product_line <> "Trains"  --2
GROUP BY product_line --4
having count(1) > 5  --5
ORDER BY 1  --6
LIMIT 2;  --7    order of execution