--consultas sql
SELECT count(DISTINCT(d.codigo_docente)) as "cantidad de docentes"
from docente d,materia m,doc_mat dm
where d.codigo_docente=dm.codigo_docente and dm.codigo_mat=m.codigo_mat

select *
from horario h
where h.fecha_inicio >= '31-12-2001' and h.fecha_inicio <= '31-12-2007'

where h.fecha_inicio BETWEEN '31-12-2001' and '31-12-2007'

SELECT d.nombre_docente,m.nombre_mat,upper(D.nombre_docente)
from docente d,materia m,doc_mat dm
where d.codigo_docente=dm.codigo_docente
 and dm.codigo_mat=m.codigo_mat and lower(d.nombre_docente)=lower('marcelo')
 
 select a1.codigo_aula,a1.capacidad
 from aula a1 
 where a1.capacidad = 80
 
SELECT d.nombre_docente
from docente d,materia m,doc_mat dm
where d.codigo_docente=dm.codigo_docente
 and dm.codigo_mat=m.codigo_mat and 
 (lower(d.nombre_docente) like (lower('L%a')) or lower(d.nombre_docente) like(lower('r__y%z')))

 create VIEW otro AS
SELECT d.nombre_docente
from docente d,materia m,doc_mat dm
where d.codigo_docente=dm.codigo_docente
 and dm.codigo_mat=m.codigo_mat and 
 (lower(d.nombre_docente) like (lower('L%a')) or lower(d.nombre_docente) like(lower('r__y%z')))
 
 select *
from horario h
where h.fecha_inicio= CURRENT_DATE

SELECT  initcap(d.nombre_docente),m.nombre_mat,dia.nombre_dia,h.horario_inicio,h.horario_salida
from docente d,materia m,doc_mat dm,hora_mat_aula hma,horario h,dia 
where d.codigo_docente=dm.codigo_docente
 and dm.codigo_mat=m.codigo_mat and m.codigo_mat=hma.codigo_mat
 and dia.id_dia=hma.id_dia and h.id_horario=hma.id_horario
and lower(dia.nombre_dia)=lower('lunes') and h.horario_inicio >='14:00' 
and h.horario_salida <= '17:00'

select a.codigo_aula,count(*)
from horario h, hora_mat_aula hma,aula a,materia m
where h.id_horario=hma.id_horario and a.id_aula=hma.id_aula 
and m.codigo_mat=hma.codigo_mat and lower(h.turno_hor) =lower('tarde')
GROUP by a.codigo_aula 
HAVING count(*)>= 0
order by a.codigo_aula desc