-- Question 1
select c.city,
       c.name
from products p,
     customers c,
     orders o
where c.city in (select p.city
	  from products p
	  group by p.city
	  order by count(quantity) desc
	  limit 1)
group by c.city, c.name;


--Question 2
select c.city,
       c.name
from products p,
     customers c,
     orders o
where c.city in (select p.city
	  from products p
	  group by p.city
	  order by count(quantity) desc
	  limit 2)
group by c.city, c.name;
--nobody lives in Newark

-- Question 3
select name
from products
group by name, priceUSD
having priceUSD > (select avg(priceUSD)
                   from products);

--Question 4
select distinct c.name,
		c.cid,
                p.pid,
                p.priceUSD
from customers c,
     products p,
     orders o
where (c.cid = o.cid)
  and (p.pid = o.pid)
order by priceusd desc;

--Question 5
select coalesce(c.name),
       count(ordno)
from customers c,
     orders o
where (c.cid = o.cid)
group by c.name;

--Question 6
select distinct c.name as "CUSTOMER NAME",
       a.name as "AGENT NAME",
       p.name as "PRODUCT NAME"
from customers c,
     products p, 
     agents a,
     orders o
where (c.cid = o.cid)
  and (p.pid = o.pid)
  and (a.aid = o.aid)
  and (a.city = 'New York')

--Question 7
select o.dollars
from orders o,
     products p
having o.dollars >= (select priceUSD
                     from products
                     where 

     



           

