create TRIGGER insertar_docente2 after insert on docente
for each row
begin
    declare ci int;
    set ci = new.ci_doc;
    if new.genero='f' then
     insert into `historial_doc` values(new.ci_doc,new.cod_doc,new.nombre,new.genero,
     user(),'INSERT',now());
      else 
      delete from docente where ci_doc=ci; 
     end if;
end
create TRIGGER delete_docente after delete on docente
for each row
begin
     insert into `historial_doc` values(old.ci_doc,old.cod_doc,old.nombre,old.genero,
     user(),'DELETE',now());
end
CREATE DEFINER = 'root'@'localhost' TRIGGER `update_doc` BEFORE UPDATE ON `docente`
  FOR EACH ROW
BEGIN
insert into `historial_doc` values(old.ci_doc,old.cod_doc,old.nombre,old.genero,
     user(),'UPDATE',now());

END;