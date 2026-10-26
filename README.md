# SQL-Filtering
SQL Filtering Operations Using Comparison Operator and Logical operator (AND,OR,NOT,IN,BETWEEN,=,&lt;,>,&lt;> and more)
create database mastery_sql;
use mastery_sql;

create table employe(
employe_id Int primary key,
employe_name varchar(20),
department varchar(20),
salary decimal(10,2));

describe employe;

insert into employe
values
(101,'Abhishek','mech',45000),
(102,'Viraj','DA',35000),
(103,'Aayush','Design',50000),
(104,'Toufiq','DADS',12000);


-- AND
-- Question: Find employees in IT earning more than ₹40,000.
select * from employe
where department = 'IT' and
salary > 40000;

-- OR
-- Question: Find employees working in IT or HR.
select * from employe
where department ='IT' or 
department = 'DADS';

-- IN 
select * from employe
where department in('DA','DADS');

select * from employe
where salary between 30000 and 40000;
--------------------------------------------------
-- LIKE
Select employe_name 
from employe 
where employe_name like '%A%';

----------------------------------------------------------
-- DISTINCT 
select distinct department
from employe;

-- NOT
select * from employe
where department <> 'DADS';

-- Q
select * from employe;
select * from employe
where salary >= 40000;

select * from employe
where department in('DA','IT');

select * from employe 
where employe_name like '%i';

select distinct salary
from employe;

select * from employe
where salary between 30000 and 40000;

select * from employe
where  department <> 'DADS'; 
