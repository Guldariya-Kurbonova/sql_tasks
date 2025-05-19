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


-- Solution with joins (1581)
SELECT customer_id,
   count(DISTINCT v.visit_id) as count_no_trans
FROM visits as v
left join transactions as t
on v.visit_id = t.visit_id
where t.transaction_id IS NULL
group by customer_id;



-- 197. Rising Temperature
select w1.id as id from weather as w1 
inner join weather as w2
on w1.recorddate = w2.recorddate + INTERVAL '1 day'
where w1.temperature > w2.temperature;

-- Solution with Window Function (197)
select id
from (
    select id,
        recorddate,
        temperature,
        lag(temperature) over(order by recorddate) as prev_temp
    from weather)
where temperature > prev_temp;



-- 1661. Average Time of Process per Machine
SELECT 
    a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp)::numeric, 3) AS processing_time
FROM Activity a1
JOIN Activity a2
    ON a1.machine_id = a2.machine_id 
   AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'start'
  AND a2.activity_type = 'end'
GROUP BY a1.machine_id;

-- Solution with CTE
with process_duration as (
    select a1.machine_id,
        a2.timestamp - a1.timestamp as duration
    from activity as a1 
    inner join activity as a2 
    on a1.machine_id = a2.machine_id and 
    a1.process_id = a2.process_id
    where a1.activity_type = 'start' and 
    a2.activity_type = 'end' )

select machine_id,
    round(avg(duration):: numeric, 3) as processing_time
from process_duration
group by machine_id;



-- 577. Employee Bonus
SELECT e.name, b.bonus
FROM employee AS e
LEFT JOIN bonus AS b ON e.empId = b.empId
WHERE COALESCE(b.bonus, 0) < 1000;








