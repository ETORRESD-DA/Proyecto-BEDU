-- POSTWOR SESION 03
-- 11.- Traer las actividades y nombre pais
Select ac.Nombre_Actividad, p.Nombre_Pais from Actividad_Cabecero ac 
left join Paises p on (ac.Id_Pais=p.Id_Pais);

-- 12.- Traer las actividades por pais de cada consultor
Select ac.Id_Usuario_Asignado, concat(u.nombre,' ',u.App_Mat,' ',u.App_Mat) as nombre,count(ac.Id_Actividad) as actividadesxpais,
p.Nombre_Pais
from Actividad_Cabecero ac join Usuarios u on(ac.Id_Usuario_Asignado=u.ID_Usuario)
join Paises p on (ac.Id_Pais=p.Id_Pais)
group by u.ID_Usuario,ac.Id_Pais;

-- 13.- Traer el usuario que mas ha solicitado actividades por pais, asi como el area de donde lo solicita y crear su vista
Select concat(u.nombre,' ',u.App_Mat,' ',u.App_Mat) as nombre, a.Nombre_Area,
ac.Id_Pais, count(ac.Id_Actividad) as NumAct from Actividad_Cabecero ac
 join Usuarios u on(ac.Id_Usuario_Solicitante=u.ID_Usuario)
 join Areas a on (u.ID_Area=a.ID_Area)
where ac.Id_Pais is not null and ac.Id_Usuario_Solicitante is not null
group by ac.Id_Usuario_Solicitante,ac.Id_Pais
order by NumAct desc limit 1;

-- 14 Traer el area que mas usuarios tienen y crear su vista
Select a.Nombre_Area, count(u.ID_Usuario)as NumUs from Usuarios u
join Areas a on (u.Id_Area=a.iD_area) 
group by Nombre_Area
order by Numus Desc limit 1;


-- 15.- Traer el nombre del consulto, el pais donde mas actividades han realizado y el numero de actividades ejecutadas en ese pais 
select nombre,mxa,Id_pais from
-- mostramos el maximo po cada cosultor
(Select cxp.nombre, cxp.Id_Usuario_Asignado,max(cxp.acxpa) as mxa from
 (
-- Agrupamos el numero de actividades realizadas por pais
Select concat(u.nombre,' ',u.App_Mat,' ',u.App_Mat) as nombre,ac.Id_Usuario_Asignado,count(ac.Id_Actividad) as acxpa,ac.Id_Pais  
from Actividad_Cabecero ac inner join Usuarios u on (ac.Id_Usuario_Asignado=u.Id_Usuario)
group by ac.ID_Usuario_Asignado,ac.Id_Pais
 ) as cxp
 group by cxp.Id_Usuario_Asignado) as actixcons
 inner join
-- Agupamos las actividades por pais
(Select ac.Id_Usuario_Asignado,count(ac.Id_Actividad) as acxpa,ac.Id_Pais  
from Actividad_Cabecero ac 
group by ac.ID_Usuario_Asignado,ac.Id_Pais) as consxpais
-- finalmente buscamos el nombre del pais haciendo la igualdad con el usuario y el numero de actividades
on (actixcons.Id_Usuario_Asignado=consxpais.Id_Usuario_Asignado and actixcons.mxa=consxpais.acxpa);
    
    
    









