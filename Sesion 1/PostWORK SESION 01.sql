-- 1.-	Traer los paises a los que se da soporte
Select Nombre_Pais from Paises;
-- 2.- Traer el nombre y descripcion de los estatus de las actividades
Select Descripción_Estatus from Estatus;
-- 3.- Traer el nombre de las prioridades de  lasactividades ordenadas de manera desc por su nivel de criticidad
Select * from Prioridad
Order by Nombre_corto desc;
-- 4.- Traer el nombre de 2 usaurios del sistema que tengan en como apellido materno Perez 
-- y ordenados de form asc por su apellido paterno
SELECT * FROM Usuarios
where App_Mat='Perez' order by App_Pat desc limit 2;
-- 5.- Traer todos los usuarios que tenga como apellido materno Espinosa, Garcia y Mercado
SELECT * FROM Usuarios
where App_Mat in ('Espinosa','Garcia','Mercado');
