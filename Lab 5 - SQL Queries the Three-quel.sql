--1. Get the cities of agents booking an order for customer “Basics”. This time use joins; no subqueries.
select a.city
from agents a,
     customers c,
     orders o
where (a.aid = o.aid)
      and (c.cid = o.cid)
      and (c.name = 'Basics');

--2. Get the pids of products ordered through any agent who makes at 
--least	one order for a	customer in Kyoto
select distinct o.pid
from agents a,
     customers c,
     orders o
where (a.aid = o.aid)
      and (c.cid = o.cid)
      and (c.city = 'Kyoto');

--3. Get the names of customers who have never placed an order. Use a subquery.
select name
from customers
where cid not in (select cid
		  from orders);


--4. Get the names of customers	who have never placed an order. Use an outer join.
select distinct c.name
from customers c left outer join orders o on c.cid = o.cid
where o.cid is null

--5. Get the names of customers	who placed at least one	order through an agent in their	
--city,	along with those agent(s’) names.
select distinct c.name as "CUSTOMER NAMES", 
       a.name as "AGENT NAMES"
from agents a,
     customers c,
     orders o
where (a.aid = o.aid)
      and (c.cid = o.cid)
      and (a.city = c.city); 

--6. Get the names of customers	and agents in the same city, along with	the name of the	
--city,	regardless of whether or not the customer has ever placed an order with	that	
--agent.
select distinct c.name as "CUSTOMER NAME",
                a.name as "AGENT NAME",
                c.city as "CITY"
from agents a,
     customers c
where (a.city = c.city);

--7. Get the name and city of customers who live in the city where the least number of	
-- products are	made.
select c.city,
       c.name,
       sum(quantity) as "PRODUCTS MADE"
from products p,
     customers c,
     orders o
where c.city in (select p.city
	  from products p
	  group by p.city
	  order by sum(quantity) asc
	  limit 1)
group by c.city, c.name


