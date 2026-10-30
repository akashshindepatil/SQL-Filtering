CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    mobile_no VARCHAR(15)
);

INSERT INTO customers VALUES
(101,'Rahul Sharma','Mumbai','9876543210'),
(102,'Priya Singh','Pune','9876543211'),
(103,'Amit Kumar','Delhi','9876543212'),
(104,'Sneha Patil','Nagpur','9876543213'),
(105,'Rohan Desai','Mumbai','9876543214'),
(106,'Pooja Mehta','Pune','9876543215'),
(107,'Neha Joshi','Delhi','9876543216'),
(108,'Karan Shah','Ahmedabad','9876543217'),
(109,'Anjali Gupta','Hyderabad','9876543218'),
(110,'Tarun Kumar','Bangalore','9876543219'),
(111,'Deepa Singh','Mumbai','9876543220'),
(112,'Vishal Desai','Pune','9876543221'),
(113,'Pooja Nair','Delhi','9876543222'),
(114,'Varun Nair','Nagpur','9876543223'),
(115,'Manish Bose','Mumbai','9876543224'),
(116,'Jay Bose','Pune','9876543225'),
(117,'Mohit Rao','Delhi','9876543226'),
(118,'Rahul Desai','Ahmedabad','9876543227'),
(119,'Kiran Joshi','Hyderabad','9876543228'),
(120,'Amit Mehta','Bangalore','9876543229');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders VALUES
(1,101,'Laptop',55000,'2025-01-01'),
(2,102,'Mobile',25000,'2025-01-02'),
(3,103,'Headphones',3000,'2025-01-03'),
(4,104,'Keyboard',1500,'2025-01-04'),
(5,105,'Mouse',1000,'2025-01-05'),
(6,106,'Monitor',12000,'2025-01-06'),
(7,107,'Tablet',18000,'2025-01-07'),
(8,108,'Printer',8000,'2025-01-08'),
(9,109,'Laptop',60000,'2025-01-09'),
(10,110,'Mobile',30000,'2025-01-10'),
(11,111,'Mouse',1200,'2025-01-11'),
(12,112,'Keyboard',1800,'2025-01-12'),
(13,113,'Monitor',14000,'2025-01-13'),
(14,114,'Tablet',20000,'2025-01-14'),
(15,115,'Laptop',65000,'2025-01-15'),
(16,116,'Mobile',28000,'2025-01-16'),
(17,117,'Headphones',3500,'2025-01-17'),
(18,118,'Printer',8500,'2025-01-18'),
(19,119,'Laptop',58000,'2025-01-19'),
(20,120,'Monitor',15000,'2025-01-20');

SELECT * from customers;
select * from orders;
---------------------------------------------------------------------------------------------------------
-- Q1. Display customer names, city, product name, and order amount for all customers who have placed orders.
SELECT a.customer_name,a.city,
b.product_name,b.amount
from customers as a
left join orders as b
on a.customer_id = b.customer_id;

-- Q2. Display customer names and their respective order IDs along with order dates.
SELECT a.customer_name,
b.order_id,b.order_date
from customers as a
inner join orders as b
on a.customer_id = b.customer_id;

-- Q3. Display the customer name, product name, and amount for customers who purchased a Laptop.
SELECT a.customer_name,
b.product_name,b.amount
from customers as a
inner join orders as b
on a.customer_id = b.customer_id
where b.product_name = 'laptop';


-- Q4. Display customer names, mobile numbers, product names, and order amounts for all orders greater than ₹20,000.
SELECT a.customer_id,a.customer_name,a.mobile_no,
b.product_name,b.amount
from customers as a
inner join orders as b
on a.customer_id = b.customer_id
where b.amount > 20000;

-- Q5. Display customer names, city, product name, and order amount for customers who purchased products on or after 2025-01-10.
SELECT a.customer_id,a.customer_name,a.city,
b.product_name,b.amount,b.order_date
from customers as a
join orders as b
on a.customer_id = b.customer_id
where b.order_date >= "2025-01-10";

-- Q6. Display all customers along with their order IDs and product names, including customers who have not placed any orders.
SELECT a.*,
b.order_id,b.product_name
from customers as a
left join orders as b
on a.customer_id = b.customer_id;

-- Q7. Display all customers and their order amounts. If a customer has not placed an order, display NULL for the amount.
SELECT a.*,
b.amount
from customers as a
left join orders as b
on a.customer_id = b.customer_id

-- Q8. Display all customers from Mumbai along with their purchased products, including customers without orders.
SELECT a.*,
b.product_name
from customers as a
left join orders as b
on a.customer_id = b.customer_id
where a.city = 'mumbai';

-- Q9. Display all customers along with their order dates and product names. Show all customers even if they have not purchased anything.
SELECT a.*,
b.product_name,b.order_date
from customers as a
left join orders as b
on a.customer_id = b.customer_id;

-- Q10. Display the names of customers who have not placed any orders.
SELECT a.customer_id,a.customer_name
from customers as a
left join orders as b
on a.customer_id = b.customer_id
where b.order_id is null;

-- Q11. Display all orders along with customer names and cities.
SELECT a.customer_id,a.customer_name,a.city,
b.*
from customers as a
right join orders as b
on a.customer_id = b.customer_id;

-- Q12. Display all orders with customer names, product names, and order amounts.
SELECT a.customer_name,
b.product_name,b.amount
from customers as a
right join orders as b
on a.customer_id = b.customer_id;

-- Q13. Display all orders along with customer mobile numbers, including orders for which customer information is missing.
SELECT b.order_id,a.customer_name,a.mobile_no,
    b.product_name,b.amount
    from customers as a
    right join orders as b
    on a.customer_id = b.customer_id;

-- Q14. Display all orders placed after 2025-01-10 along with customer names and cities.
SELECT a.customer_id,a.customer_name,a.city,
b.order_date
from customers as a
right join orders as b
on a.customer_id = b.customer_id
where b.order_date > '2025-01-10';

-- Q15. Display all orders along with customer names and product names, sorted by order amount in descending order.
SELECT a.customer_id,a.customer_name,
b.product_name,b.amount
from customers as a
right join orders as b
on a.customer_id = b.customer_id
order by b.amount desc;

-- Q16. Display all customers and all orders, including customers who have not placed orders and orders that do not have matching customer records.
SELECT
    a.customer_id,
    a.customer_name,
    b.order_id,
    b.product_name,
    b.amount
FROM customers AS a
LEFT JOIN orders AS b
    ON a.customer_id = b.customer_id
union
SELECT
    a.customer_id,
    a.customer_name,
    b.order_id,
    b.product_name,
    b.amount
from customers as a
right join orders as b
    on a.customer_id = b.customer_id;    

-- Q17. Display customer names, cities, order IDs, and order amounts for all records from both tables.
SELECT
    a.customer_name,
    a.city,
    b.order_id,
    b.amount
FROM customers AS a
LEFT JOIN orders AS b
    ON a.customer_id = b.customer_id

UNION ALL

SELECT
    a.customer_name,
    a.city,
    b.order_id,
    b.amount
FROM customers AS a
RIGHT JOIN orders AS b
    ON a.customer_id = b.customer_id
WHERE a.customer_id IS NULL;

-- Q18. Display all customers and orders, including unmatched records, sorted by customer ID.
SELECT a.customer_id,
    a.customer_name,
    a.city,
    b.order_id,
    b.amount
from customers as a
left join orders as b
on a.customer_id = b.customer_id
union all
select a.customer_id,
    a.customer_name,
    a.city,
    b.order_id,
    b.amount
from customers as a
right join orders as b
on a.customer_id = b.customer_id
where a.customer_id is null
order by customer_id asc;

-- Q19. Display all customers and orders, including unmatched records, where the order amount is greater than ₹15,000.
SELECT a.customer_id,a.customer_name,a.city,
b.order_id,b.product_name,b.amount
from customers as a
left join orders as b
on a.customer_id = b.customer_id
where b.amount > 15000
union all
SELECT a.customer_id,a.customer_name,a.city,
b.order_id,b.product_name,b.amount
from customers as a
right join orders as b
on a.customer_id = b.customer_id
where a.customer_id is null
and b.amount > 15000;

-- Q20. Display all customer and order details, including customers without orders and orders without customers.
SELECT a.customer_id,a.customer_name,a.city,
b.order_id,b.product_name,b.amount
from customers as a
left join orders as b
on a.customer_id = b.customer_id
union all
SELECT a.customer_id,a.customer_name,a.city,
b.order_id,b.product_name,b.amount
from customers as a
right join orders as b
on a.customer_id = b.customer_id
where a.customer_id is null;
 

-- Q21. Display every possible combination of customer names and product names.
SELECT a.customer_id,a.customer_name,
b.product_name
from customers as a
cross join orders as b;

-- Q22. Display every possible combination of customer cities and order amounts.
SELECT a.city,
b.amount
from customers as a
cross join orders as b;

-- Q23. Display every possible combination of customer names and order dates.
SELECT a.customer_name,
b.order_date
from customers as a
cross join orders as b;

-- Q24. Display every possible combination of customer names and product names, where the product is Laptop.
SELECT a.customer_name,
b.product_name
from customers as a
cross join orders as b
where b.product_name = 'laptop';

-- Q25. Display every possible combination of customer names and product names, sorted alphabetically by customer name.
SELECT a.customer_name,
b.product_name
from customers as a
cross join orders as b
order by a.customer_name asc;