-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
select e.nombre,e.apellido_paterno from empleado as e
where id_puesto in (Select id_puesto from puesto where salario > 10000);
select e.nombre,e.apellido_paterno, (Select salario from puesto where salario > 10000 and id_puesto = e.id_puesto) as salario
from empleado as e;
-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
 select id_empleado,min(ventas) asminven, max(ventas) as maxven from 
 ( Select id_empleado, clave,count(*) ventas from venta group by id_empleado,clave) as ventas_total
 group by id_empleado;
-- ¿Cuál es el nombre del puesto de cada empleado?
Select nombre, apellido_paterno, (Select p.nombre from puesto as p where e.id_puesto=p.id_puesto) as puesto
from empleado as e;

