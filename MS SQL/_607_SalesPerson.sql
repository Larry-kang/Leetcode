DECLARE @SalesPerson TABLE (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date)
DECLARE @Company TABLE (com_id int, name varchar(255), city varchar(255))
DECLARE @Orders TABLE (order_id int, order_date date, com_id int, sales_id int, amount int)

insert into @SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', '4/1/2006')
insert into @SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', '5/1/2010')
insert into @SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', '12/25/2008')
insert into @SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', '1/1/2005')
insert into @SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', '2/3/2007')

insert into @Company (com_id, name, city) values ('1', 'RED', 'Boston')
insert into @Company (com_id, name, city) values ('2', 'ORANGE', 'New York')
insert into @Company (com_id, name, city) values ('3', 'YELLOW', 'Boston')
insert into @Company (com_id, name, city) values ('4', 'GREEN', 'Austin')

insert into @Orders (order_id, order_date, com_id, sales_id, amount) values ('1', '1/1/2014', '3', '4', '10000')
insert into @Orders (order_id, order_date, com_id, sales_id, amount) values ('2', '2/1/2014', '4', '5', '5000')
insert into @Orders (order_id, order_date, com_id, sales_id, amount) values ('3', '3/1/2014', '1', '1', '50000')
insert into @Orders (order_id, order_date, com_id, sales_id, amount) values ('4', '4/1/2014', '1', '4', '25000')

SELECT * FROM @SalesPerson
SELECT * FROM @Company
SELECT * FROM @Orders

--SELECT orders.sales_id
--FROM @Orders orders
--JOIN @Company company ON orders.com_id = company.com_id

SELECT a.name
FROM @SalesPerson a
WHERE a.sales_id NOT IN
(
SELECT orders.sales_id
FROM @Orders orders
JOIN @Company company ON orders.com_id = company.com_id
WHERE company.name = 'RED'
)