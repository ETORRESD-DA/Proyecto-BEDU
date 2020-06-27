-- ¿Cuál es el nombre de los empleados con el puesto 4?
Select nombre from empleado where id_puesto=4;
-- ¿Qué puestos tienen un salario mayor a $10,000?
Select nombre from puesto where salario > 10000;
-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
Select nombre from articulo where precio > 1000 and iva>100;
-- ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
Select * from venta where id_articulo=135 or id_articulo=963 and id_empleado=835  or id_empleado=369;
-- Estuvo mal la respuesta correcta es la siguiente
Select * from venta where id_articulo in(135,963) and id_empleado in(835,369);




