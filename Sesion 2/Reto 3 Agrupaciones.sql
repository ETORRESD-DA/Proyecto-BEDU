-- ¿Cuántos registros hay por cada uno de los puestos?
select nombre,count(nombre) as resumen from puesto group by nombre;
-- ¿Cuánto dinero se paga en total por puesto?
select nombre,sum(salario) as resumen_pago from puesto group by nombre;
-- ¿Cuál es el número total de ventas por vendedor?
select id_empleado,count(id_empleado) as ventas_totales from venta group by id_empleado;
-- ¿Cuál es el número total de ventas por artículo?
select id_articulo,count(id_articulo) as ventas_totales from venta group by id_articulo;
-- ¿Cuál es el número total de ventas por vendedor?
select e.nombre, count(v.id_empleado) as ventas_totales from venta v, empleado e 
where v.id_empleado=e.id_empleado group by v.id_empleado;
-- ¿Cuál es el número total de ventas por artículo?
select a.nombre, count(v.id_articulo) as ventas_totales from venta v, articulo a 
where v.id_articulo=a.id_articulo group by v.id_articulo;

