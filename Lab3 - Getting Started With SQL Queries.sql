-- Lab 3 - Completed on January 30 --

-- 1. List	the	name	and	city	of	agents	named	Smith. --
select name, city 
from agents 
where name = 'Smith';

-- 2. List	pid,	name,	and	quantity	of	products	costing	more	than	US$1.25. --
select pid, name, quantity 
from products 
where (priceusd > 1.25);

-- 3. List	the	ordno	and	aid	of	all	orders -- 
select ordno, aid 
from orders;

-- 4. List	the	names	and	cities	of	customers	in	Dallas -- 
select name, city 
from customers 
where city = 'Dallas';

-- 5. List	the	names	of	agents	not	in	New	York	and	not	in	Newark -- 
select name 
from agents 
where (city != 'New York') and (city !=  'Newark');

-- 6. List	all	data	for	products	not	in	New	York	or	Newark	that	cost	US$1	or	more. --
select * 
from products 
where (city != 'New York') and (city != 'Newark') and (priceusd > 1.00);

--7. List	all	data	for	orders	in	January	or	March --
select * 
from orders 
where (mon = 'jan') or (mon = 'mar');

-- 8. List	all	data	for	orders	in	February	less	than	US$100. -- 
select * 
from orders 
where (mon = 'feb') and (dollars < 100);
-- There is none? --

-- 9. List	all	orders	from	the	customer	whose	cid	is	C001. --
select * 
from orders
where cid = 'c001';