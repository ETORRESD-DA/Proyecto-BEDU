-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
select * from articulo where nombre like '%PASTA%';
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select * from articulo where nombre like '%Cannelloni%';
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select * from articulo where nombre like '%-%';