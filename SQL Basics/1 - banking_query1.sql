create database demo;
use demo;-- replace demo with your database name.

select * from BRANCH;
select * from CUSTOMERS;
select * from ACCOUNTS;
select * from TRANSACTIONS;
select * from EMPLOYEES;

-- select -- list all the columns / *
--  from -- tables
-- where -- filter conditions
 
 -- 1. write a query to fetch trns_id,trns_date,amount for net banking transactions only
 select TRNS_ID,TRNS_DATE,AMOUNT
 from TRANSACTIONS
 where TRNS_TYPE = "net banking";
 
 -- Table Alias / Column Alias
 select T.TRNS_ID,T.TRNS_DATE,T.AMOUNT
 from TRANSACTIONS  -- Table alias
 where TRNS_TYPE = "net banking";
 -- Column alias
 select TRNS_ID, TRNS_DATE, AMOUNT as TRNS_AMOUNT
 from TRANSACTIONS
 where TRNS_TYPE = "net banking";
 
 -- 2. write a query to fetch trns_id,trns_date,amount for net banking transactions only and fetch only successful transactions
 select trans_id, trans_date, amount 
 from transactions
 where trans_type = "net banking"
 and status = "Success";
 
 -- 3. write a query to fetch employee name and salary whose salary is greater than 50000 and who belong to BR1
 select first_name, last_name, salary
 from employees
 where salary > 50000 and branch_code = "BR1";

-- 4. write a query to fetch employees whose name starts with J or whose salary is greater than 70000
select * 
from employees
where FIRST_NAME like "J%" or SALARY > 70000;

-- 5. fetch accounts with balance in between 3000 and 5000
select * from accounts
where BALANCE between 3000 and 5000;

-- 6. find if given numbers are even or odd? given nmbers are 432 and 77
select CASE WHEN 432 % 2 = 0 then "EVEN" else "ODD" end as odd_or_even;

-- 6. find customers who did not provide a phone number
select * from customers;

select *
from customers
where PHONE_NO is null;

-- 7. find all different type of transactions
select * from transactions;

select DISTINCT TRNS_TYPE from transactions;

-- 8. sort the employee data as per first_name and highest salary
select *
from employees
ORDER BY FIRST_NAME,salary DESC

select * from ACCOUNTS
order by acc_type, balance desc;

-- 9. select the first 5 transactions
select * from transactions LIMIT 5;

-- mssql
select top 5 * from transaction

-- oracle
select * from transactions where rownum <= 5
select * from transactions fetch next 5 records only;


-- Assignment
-- 1. Fetch all transaction data
select * from transactions;

-- 2. Fetch account number and acc_type from all accounts
select account_number, acc_type from accounts;

-- 3. fetch customer id and name of all active customers
select * from customers;

select customer_id,first_name,last_name from customers
where is_active = "true";

-- 4.fetch customer id and name of all active customers who were born after 2000.
select customer_id,first_name,last_name,DOB from customers
where year(DOB) > 2000;

-- 5. find employees whose salary ranges from 50k to 70k
select * from employees
where salary between 50000 and 70000;

-- 6.Find customers who have not provided basic information such as address or phone number.
select * from customers
where phone_no is null or address is null;

-- 7.find customers having "oo" in their name
select * from customers 
where first_name like "%oo%" or last_name like "%oo%";

-- 8.Identify the total no. of wire transfer transactions. 
select count(*) from transactions
where trns_type = "wire transfer";

select trns_type,count(*) from transactions
group by trns_type;

-- 9.Identify the unique transaction type
select distinct trns_type from transactions;

-- 10.Fetch the first 5 transactions 
select * from transactions LIMIT 5;

-- 11.Fetch the inactive customers name, phone no, address and dob. Display the oldest customer first. 
select * from customers;

select first_name,last_name,phone_no,ADDRESS,dob
from customers
where is_active = "false"
order by DOB

-- 12.Find the customers who are from either "77 Lien Park", "337 Westend Park" or "9 Troy Plaza". 
select * from customers
where address = "77 Lien Park" or address = "337 Westend Park" or address = "9 Troy Plaza";

-- 13. Fetch all customers who have "Park" or "Plaza" in their address
select * from customers
where address like "%park%" or address like "%Plaza%";