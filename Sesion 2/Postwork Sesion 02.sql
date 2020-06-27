-- POSTWORK SESION 02
-- 6.- Traera todas las actividades, que en el nombre tenga la palabra monitoreo
Select * from Actividad_Cabecero
where Nombre_Actividad like '%monitoreo%';
-- 7.- Traer el numero de actividades por pais
Select Id_pais, count(Id_Pais) as casosPais from Actividad_Cabecero
 where Id_Pais IS NOT NULL group by Id_Pais;
 -- 8.-  Traer el pais con mayornumero de actividades
Select Id_pais, count(Id_Pais) as casosPais from Actividad_Cabecero
 where Id_Pais IS NOT NULL group by Id_Pais order by casosPais desc limit 1;
-- 9.-  Traer el id pais y nombre del pais con mas actividades realizadas
Select ac.Id_pais, count(ac.Id_Pais) as casosPais, (Select p.Nombre_Pais from Paises p where ac.Id_Pais=p.Id_Pais) as Pais from Actividad_Cabecero ac
 where ac.Id_Pais IS NOT NULL group by ac.Id_Pais order by casosPais desc limit 1;
-- 10.- Traer el nombre del consultor con mas y menos actividades 
Select ac.Id_Usuario_Asignado, count(ac.Id_Usuario_Asignado) as conteo,
(Select concat(u.nombre,' ', u.App_Mat,' ', u.App_Pat) as nombre  from Usuarios u
where ac.Id_Usuario_Asignado=u.ID_Usuario) as nombre
from Actividad_Cabecero ac where ac.Id_Usuario_Asignado is not NULL group by ac.Id_Usuario_Asignado
order by conteo desc limit 1;






