SELECT * from customers

SELECT * from order_items

SELECT * from orders

SELECT * from payments

SELECT * from product_reviews

SELECT * from products
--Level->1
--1
SELECT name,email from customers 
--2
select * from products 
--3
SELECT DISTINCT category from products
--4
select * from products where price >1000
--5
select * from products where price >2000 and price <5000
--6
select * from customers where customer_id in (3,5,2,4,7,8,30,12,24,17,19,28)
--7
select * from customers where name like ('A%')
--8
select * from products where category like ('Electronics') and price<3000
--9
select name,price from products order by price desc
--10
select name,price from products order by price , name asc

--Level-2
--1
SELECT * from orders where customer_id is NULL 
--2
select name as 'Customer Name',email as 'Customer Email' from customers
--3
select order_item_id,(quantity*item_price) as  'total value per item ' from order_items
--4
select (name||phone) as NamePhone from customers
--5
select *,strftime('%d',order_date) as Date from orders
--6
select * from products where stock_quantity is 0

--Level-3
--1
select count(*) as ' total number of orders placed' from orders 
--2
select sum(amount_paid) as 'total revenue collected' from payments 
--3
select sum(total_amount)/count(order_id) as 'average order value' from orders
--4
select count(Distinct customer_id)as 'active customers' from orders
--5
select customer_id,count(order_id) from orders GROUP by customer_id
--6
select customer_id,sum(total_amount) from orders group by customer_id
--7
with tempTable as(
select o.quantity,o.product_id,p.stock_quantity,p.category
from order_items o
inner join products p
on o.product_id=p.product_id
)
select category,sum(quantity) as 'products sold per category' from tempTable group by category
--8
with tempTable as(
select o.item_price,p.category
from order_items o
inner join products p
on o.product_id=p.product_id
)
select category,avg(item_price) as 'products sold per category' from tempTable group by category
--9

