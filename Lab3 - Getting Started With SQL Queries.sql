/* Lab 3 - Completed on January 30 */

select name, city from agents where name = 'Smith';

select pid, name, quantity from products where (priceusd > 1.25);

select ordno, aid from orders;

select name, city from customers where city = 'Dallas';

select name from agents where (city != 'New York') and (city !=  'Newark');

select * from products where (city != 'New York') and (city != 'Newark') and (priceusd > 1.00);

select * from orders where (mon = 'jan') or (mon = 'mar');

select * from orders where (mon = 'feb') and (dollars < 100);
/*There is none? */

select * from orders where cid = 'c001';

