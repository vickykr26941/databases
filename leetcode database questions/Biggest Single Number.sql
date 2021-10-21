-- SQL Schema
-- Table my_numbers contains many numbers in column num including duplicated ones.
-- Can you write a SQL query to find the biggest number, which only appears once.

-- +---+
-- |num|
-- +---+
-- | 8 |
-- | 8 |
-- | 3 |
-- | 3 |
-- | 1 |
-- | 4 |
-- | 5 |
-- | 6 | 
-- For the sample data above, your query should return the following result:
-- +---+
-- |num|
-- +---+
-- | 6 |
-- Note:
-- If there is no such number, just output null.
 



-- # first approach 

select a.num from my_numbers a, my_numbers b
where a.num = b.num group by a.num order by count(*) asc, a.num desc  limit 1;

-- #second approach 

select max(num) as num
from(
    select num from my_numbers group by num having count(num) = 1
) as t;


-- # third approach 
select num from my_numbers group by num having count(num) = 1
order by num desc limit 1;



