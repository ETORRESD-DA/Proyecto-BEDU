-- 1 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados 
-- cuyo nombre empiece con a.
Select employeeNumber,firstname, lastname from employees where  firstName like 'A%';
-- 2 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados 
-- cuyo nombre termina con on.
Select employeeNumber,firstname, lastname from employees where  firstName like '%on';
-- 3 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados 
-- cuyo nombre incluye la cadena on.
Select employeeNumber,firstname, lastname from employees where  firstName like '%on%';
-- 4 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados 
-- cuyos nombres tienen tres letras e inician con T y finalizan con m.
Select employeeNumber,firstname, lastname from employees where  firstName like 'T%_%m';
-- 5 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados 
-- cuyo nombre no inicia con B.
Select employeeNumber,firstname, lastname from employees where  firstName not like 'B%';
-- 6 Dentro de la tabla products, obten el código de producto y nombre de los productos 
-- cuyo código incluye la cadena _20.
Select productCode,productName from products where productCode like '%_20%';
-- 7 Dentro de la tabla orderdetails, obten el total de cada orden.
Select orderNumber,sum(quantityOrdered) from orderdetails group by orderNumber;
--  8 Dentro de la tabla orders obten el número de órdenes por año.
Select salesyear,count(*) from (
Select orderNumber, year (orderDate) as salesyear from orders) as Total_salesyear
group by salesyear;
-- 9 Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
Select *  from offices 
where country = 'USA';
-- 10 Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
Select customerNumber, max(amount) as Maxamount, checkNumber 
from payments group by customerNumber,checkNumber Order by Maxamount desc limit 1 ;
-- 11 Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
Select  customerNumber, checkNumber, amount  from payments
 where amount > (Select avg(amount) as avgTotal from payments);
 -- 12 Obten el nombre de aquellos clientes que no han hecho ninguna orden.
Select CustomerName from customers where customerNumber not in (
select customerNumber from orders group by customerNumber);
-- 13 Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
Select max(products_Total) as Maximo,min(products_Total) as minimo,avg(products_Total) as promedio from (
SELECT orderNumber, count(*) as products_Total 
FROM orderdetails group by orderNumber) as p_Totales;
-- 14 Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
select cus_State,sum(orders) from ( 
SELECT count(*) as orders,(
select c.state 
from customers as c where c.customerNumber=o.customerNumber) as cus_State
FROM orders as o group by customerNumber) as orders_state
group by cus_State