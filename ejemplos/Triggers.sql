
--triggers
CREATE TABLE docente_respaldo (usuario VARCHAR(20),accion VARCHAR(20), fecha date, 
codigo_docente INTEGER,  nombre_docente VARCHAR(50) , apellido_pat VARCHAR(50),
 apellido_mat VARCHAR(50), profesion VARCHAR(50)); 

CREATE OR REPLACE FUNCTION bitacora_docente() RETURNS trigger AS 
$$
DECLARE
 accion text;
 usuario text;
 fecha date;
 BEGIN
     accion:=TG_OP;
     usuario:=user;
     fecha:=now();
     if accion = 'DELETE' then
     INSERT INTO docente_respaldo VALUES(usuario,accion,fecha,
     OLD.codigo_docente, OLD.nombre_docente, OLD.apellido_pat, 
     OLD.apellido_mat, OLD.profesion);
     END IF;
     if accion = 'UPDATE' then
    INSERT INTO docente_respaldo VALUES(usuario,accion,fecha,
    OLD.codigo_docente, OLD.nombre_docente, OLD.apellido_pat, 
     OLD.apellido_mat, OLD.profesion);
     END IF;
     if accion = 'INSERT' then
    INSERT INTO docente_respaldo VALUES(usuario,accion,fecha,
    NEW.codigo_docente, NEW.nombre_docente, NEW.apellido_pat, 
     NEW.apellido_mat, NEW.profesion);
    end if;
RETURN null;
END;
$$ 
 LANGUAGE 'plpgsql';


CREATE TRIGGER Bit_docente after INSERT OR UPDATE OR DELETE ON docente 
			    FOR EACH ROW  EXECUTE PROCEDURE bitacora_docente();
CREATE OR REPLACE FUNCTION res_docente() RETURNS trigger AS 
$$
DECLARE
 accion text;
 usuario text;
 fecha date;
 BEGIN
     accion:=TG_OP;
     
     if new.profesion ISNULL then
     RAISE EXCEPTION 'en la columna profesion tiene que insertar datos';
    end if;
    
RETURN null;
END;
$$ 
 LANGUAGE 'plpgsql';


CREATE TRIGGER restriccion_docente after INSERT OR UPDATE ON docente 
			    FOR EACH ROW  EXECUTE PROCEDURE res_docente();