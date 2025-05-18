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
