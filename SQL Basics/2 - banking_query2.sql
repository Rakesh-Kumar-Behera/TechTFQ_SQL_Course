-- Inner Join, CASE statement, Aggregate function

-- Aggregate Functions
select count(*) , sum(amount), avg(amount), min(trns_date) , max(trns_date)
from transactions
where trns_type = "wire transfer";

-- count(*) will travel all the columns then the rows to return number of records
-- but if we provide any hard-coded number or string it wii not travell all the coulumns but it will return the same result.
-- count(*) will return the result comparatively slower, but it doesn't make any difference these days bcoz of latest RDBMS.
select count(*), count(1), count(124), count('ABC')
from customers; 

-- 14) Find employees working in Mumbai 
select * from employees;

-- using subquery
select * from employees
where BRANCH_CODE = (select branch_code from BRANCH
                        where BRANCH_NAME = "Mumbai");

-- using join
select E.* 
from employees E
inner join BRANCH B
on E.BRANCH_CODE = B.BRANCH_CODE
where B.BRANCH_NAME = "Mumbai";

-- 15. Find the total no. of successful transactions that belongs to inactive customers . 
select * from accounts;
select * from customers;
select * from transactions;

select count(*) from customers C
inner join accounts A
on A.cust_id = C.customer_id
inner join transactions T 
on A.account_number = T.acc_number
where  T.status = "Success" and C.is_active = 'false';

-- 16. Categorize employees based on their salary 
-- [Below 50k is Low salary, between 50k to 70 is medium salary , above 70k is high salary.]

select * from employees;

select first_name,last_name,salary, 
case 
when salary < 50000 then "Low salary"
when salary between 50000 and 70000 then "Medium salary"
else "High salary"
end as salary_category from employees;

select concat(first_name," ",last_name) as Name,salary, 
case 
when salary < 50000 then "Low salary"
when salary between 50000 and 70000 then "Medium salary"
when salary > 70000 then "High salary"
else "Strange"
end as salary_category from employees;

-- 17) Find the total balance of all savings account

select sum(balance) as Total_Balance
from accounts 
GROUP BY acc_type
having acc_type = "Saving";

select sum(balance) as Total_Balance
from accounts 
where acc_type = "Saving";

-- 18) Display the total account balance in all the loan and saving accounts
select sum(balance) as Total_Balance
from accounts 
where acc_type in ("loan","Saving");

select acc_type,sum(balance) as Total_Balance
from accounts 
GROUP BY acc_type
having acc_type = "Saving" or acc_type = "loan";
