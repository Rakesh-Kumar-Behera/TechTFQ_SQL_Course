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

Assignents for Session 6:
3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
4) Find customers whose phone number has either parenthesis "()" or a plus sign "+"
5) Find customers whose phone number does not have any space.
6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
7) Find orders which sold the product for price higher than its original price.
8) Find the average sales order price
9) Count total no of orders.
10) Find the total quantity sold.
11) Fetch the first order date and the last order date.