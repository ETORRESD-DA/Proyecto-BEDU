-- ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) as salarioo_promedio from puesto;
-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre??
SELECT COUNT(*) FROM articulo where nombre like '%PASTA%';
-- ¿Cuál es el salario mínimo y máximo?
select max(salario) as max_salario, min(salario) as min_salario from puesto;
-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
select sum(salario) from puesto where id_puesto > (Select count(id_puesto) - 5 from puesto order by id_puesto);










