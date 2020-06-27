-- Use Rigth Join
-- 1.- Obten el código de producto, nombre de producto y descripción de todos los productos.
Select p.productCode, p.productName, p.productDescription from products p;
-- 2.- Obten el número de orden, estado y costo total de cada orden.
Select od.orderNumber,o.status, sum(od.priceEach) from orderdetails as od
right join orders o on (od.orderNumber = o.orderNumber)
group by o.orderNumber;
Select od.orderNumber, sum(od.priceEach),o.status from orderdetails as od
right join orders o on (od.orderNumber=o.orderNumber)
group by od.orderNumber,o.status;
-- 3.- Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio 
-- de cada pieza que muestre los detalles de cada orden.
Select od.orderNumber,o.orderDate,p.productLine,p.productName,od.quantityOrdered, p.buyPrice from orderdetails as od
right join orders o on (od.orderNumber=o.orderNumber)
right join products p on (od.productCode=p.productCode);
-- 4.- Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
Select od.orderNumber,p.productName,p.MSRP, p.buyPrice from orderdetails as od
right join products p on (od.productCode=p.productCode);
-- USE LEFT JOIN
-- 5.- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
Select c.customerNumber, c.customerName, o.orderNumber, c.state from customers c
left join orders o on (c.customerNumber=o.customerNumber);
-- 6.- Obtén los clientes que no tienen una orden asociada.
Select c.customerNumber, c.customerName, o.orderNumber, c.state from customers c
left join orders o on (c.customerNumber=o.customerNumber)
where o.OrderNumber is NULL;
-- 7.- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, 
-- es decir, los clientes asociados a cada empleado.
Select e.lastName,e.firstname,c.customerName,p.checkNumber,p.amount 
from employees e
left join customers c on (c.salesRepEmployeeNumber=e.employeeNumber)
left join payments p on (c.customerNumber=p.customerNumber);
-- USE RIGHT JOIN
-- 7.- Repite los ejercicios 5 a 7 usando RIGHT JOIN.
-- Obtén los clientes que no tienen una orden asociada.
Select c.customerNumber, c.customerName, o.orderNumber, c.state from orders o 
right join customers c on (c.customerNumber=o.customerNumber)
where o.OrderNumber is NULL;
-- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, 
-- es decir, los clientes asociados a cada empleado.
Select e.lastName,e.firstname,c.customerName,p.checkNumber,p.amount 
from customers c
right join employees e on (c.salesRepEmployeeNumber=e.employeeNumber)
right join payments p  on (c.customerNumber=p.customerNumber);
-- 8.- Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
-- 8A
-- create view ETLP08A as (
-- Select c.customerNumber, c.customerName, o.orderNumber, c.state from orders o 
-- right join customers c on (c.customerNumber=o.customerNumber)
-- where o.OrderNumber is NULL);
Select * from ETLP08A;
-- 8B
-- create view ETLP08B as (
-- Select e.lastName,e.firstname,c.customerName,p.checkNumber,p.amount 
-- from customers c
-- right join employees e on (c.salesRepEmployeeNumber=e.employeeNumber)
-- right join payments p  on (c.customerNumber=p.customerNumber)
-- );
select * from ETLP08B
