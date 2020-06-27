-- 1.- Obtener el puesto de un empleado.
-- CREATE VIEW ETLpuestoE AS (
--     SELECT CONCAT(e.nombre,' ',e.apellido_paterno) AS contacE,p.nombre AS nombre
--     FROM puesto p JOIN empleado e ON (p.id_puesto = e.id_puesto)
--     )
Select * from ETLpuestoE;

-- 2.-Saber qué artículos ha vendido cada empleado.
-- CREATE VIEW ETLventas_Empleado AS (
--     SELECT CONCAT(e.nombre,' ',e.apellido_paterno) AS nombreE,v.id_articulo AS id_articulo,
--         a.nombre AS nombreA
--     FROM venta v
--         JOIN empleado e ON (v.id_empleado = e.id_empleado)
--         JOIN articulo a ON (v.id_articulo = a.id_articulo)
--     GROUP BY v.id_empleado , v.id_articulo)
Select * From ETLventas_Empleado;

-- 3.- Saber qué puesto ha tenido más ventas.
-- CREATE VIEW ETLVentas_puesto AS (
--     SELECT p.nombre AS nombreP, COUNT(v.clave) AS ventasR
--     FROM puesto p
--     JOIN empleado e ON (p.id_puesto = e.id_puesto)
--     JOIN venta v ON (v.id_empleado = e.id_empleado)
--     GROUP BY p.nombre)
Select * from ETLVentas_puesto;

