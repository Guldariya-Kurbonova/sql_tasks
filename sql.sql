--- BASIC JOINS
--  1378. Replace Employee ID With The Unique Identifier  
/*Write a solution to show the unique ID of each user, 
  If a user does not have a unique ID replace just show null.
  Return the result table in any order.*/

select 
    u.unique_id,
    e.name
from employeeUni as u
right join employees as e
on u.id = e.id; 


-- 1068. Product Sales Analysis I
select  product_name,
    year,
    price
from sales as s
inner join product as p
on s.product_id = p.product_id;

-- 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT customer_id,
   count(v.visit_id) as count_no_trans
FROM visits as v
where v.visit_id not in 
(select visit_id from transactions)
group by customer_id;
























