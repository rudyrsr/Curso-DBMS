--funciones
create or REPLACE FUNCTION mayor(numero1 integer, numero2 integer,numero3 integer)returns text as
$$
 DECLARE
     resultado integer;
BEGIN
   resultado :=0;
   if numero1 > numero2 and numero1 > numero3 then
    resultado:=numero1;
   else 
     	if numero2 >numero1 and numero2 > numero3 then
         resultado:=numero2;
        else 
        resultado:=numero3;
      end if;
    end if;
     
    RETURN resultado;

END;
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION mayor(integer,integer)
	RETURNS text AS $$
	DECLARE
        numero1 alias for $1;
        numero2 alias for $2;
 		resultado text; 

	BEGIN
		resultado:='el resultado es:';
		if numero1 > numero2 then
			  raise EXCEPTION 'el numero1 es el mayor';
  			  resultado:=resultado||numero1;
		ELSE
 		      raise EXCEPTION 'el numero2 es el mayor'; 
 			  resultado:=resultado||numero2;
		end if;
 		RETURN resultado;
	END;
	$$
	LANGUAGE plpgsql;

    CREATE OR REPLACE FUNCTION mayor3(num1 int,num2 int ,num3 int)
	RETURNS text AS $$
	DECLARE
 		resultado text; 

	BEGIN
		resultado:='el mayor de los 3 es :';
		
        
        if num1 > num2 and num1 > num3 then
			  raise notice'el numero1 es el mayor';
  			  resultado:=resultado||' es el mumero 1 con su valor : '||num1;
		ELSE
              if num2 > num1 and num2 > num3 then
			  	raise notice'el numero2 es el mayor';
  			  	resultado:=resultado||' es el mumero 2 con su valor : '||num2;
              else
                 if num3 > num1 and num3 > num2 then
			  	 	raise notice'el numero3 es el mayor';
  			  	 	resultado:=resultado||' es el mumero 3 con su valor : '||num3;
                 else
                     raise notice'los 3 son iguales';
                     resultado:='los 3 son iguales';
                 end if;    
              
              end if;
              
		end if;
        
 		RETURN resultado;
	END;
	$$
	LANGUAGE plpgsql;

    CREATE OR REPLACE FUNCTION cadenaMayor(cad1 text,cad2 text)
	RETURNS text AS $$
	DECLARE
 		resultado text; 
        valor1 int;
        valor2 int;
	BEGIN
		resultado:='el mayor de las dos cadenas es :';
		valor1:=length(cad1);
        valor2:=length(cad2);
        
        if valor1 > valor2 then
          raise notice 'el mayor es la cadena 1';
          resultado:=resultado||' la cadena 1: '||cad1;  
        ELSE
          if valor2 > valor1 then
          raise notice 'el mayor es la cadena 2';
          resultado:=resultado||' la cadena 2: '||cad2;
          else 
               raise notice 'las 2 cadenas son del mismo tamaño';
          		resultado:='las 2 cadenas son del mismo tamaño';
          end if;   
		end if;
        
 		RETURN resultado;
	END;
	$$
	LANGUAGE plpgsql;



create or REPLACE FUNCTION primo(numero integer)returns text as
$$
 DECLARE
     resultado text;
     indice integer;
BEGIN
   resultado :=0;
   indice:=2;
   while indice < numero loop
     if numero%indice = 0 then
      raise EXCEPTION 'NO ES PRIMO';
     end if;
     indice:=indice+1;
      
   end loop;  
   resultado:='es primo';
   RETURN resultado;

END;
$$
LANGUAGE 'plpgsql';
create or REPLACE FUNCTION CADENA(cadena1 text,cadena2 text)returns text as
$$
DECLARE
 resultado text;
BEGIN
     resultado:='el mundo';
     if char_length(cadena1)>char_length(cadena2) then
      raise notice 'la cadena 1 es mas grande';
      else 
      raise notice 'la cadena 2 es mas grande';
     end if;
 	resultado:=substring('mundo',resultado);  
   
   RETURN null;

END;
$$
LANGUAGE 'plpgsql';
create or REPLACE FUNCTION COMPARACION(cadena1 text)returns BOOLEAN as
$$
DECLARE
 resultado BOOLEAN;
BEGIN
      resultado:=FALSE;
     if cadena1 ISNULL then
      resultado:= TRUE;
     end if; 
   RETURN null;

END;
$$
LANGUAGE 'plpgsql';
create or REPLACE FUNCTION CADENA_MAYOR(cadena1 text,cadena2 text,cadena3 text)returns integer as
$$
 DECLARE
     valorc1 integer;
     valorc2 integer;
     valorc3 integer;
     resultado integer;
BEGIN
   if character_length(cadena1)> char_length(cadena2) and character_length(cadena1)> char_length(cadena3) THEN
      raise notice 'la cadena 1 es el mayor tamaño';
   else if character_length(cadena2)> char_length(cadena1)and character_length(cadena2)> char_length(cadena3) THEN
       raise notice 'la cadena 2 es el mayor tamaño';
   		ELSE
         raise notice 'la cadena 3 es el mayor tamaño';
        end if;
   end if;
   valorc1:=character_length(cadena1);
   valorc2:= char_length(cadena2);
   valorc3:=char_length(cadena3);
   resultado:=el_mayor(valorc1,valorc2,valorc3);
   return resultado;
END;
$$
LANGUAGE 'plpgsql';
CREATE OR REPLACE FUNCTION "public"."el_mayor" (
  "numero1" integer,
  "numero2" integer,
  "numero3" integer
)
RETURNS integer AS
$body$
DECLARE
     resultado integer;
BEGIN
    resultado:=0;
 if numero1 > numero2 and numero1 > numero3 then
  resultado:=numero1;
  --raise notice "el mayor es el numero1";
 else 
 	if numero2 >numero1 and numero2 > numero3 then
    resultado:=numero2;
     --raise notice "el mayor es el numero2";
    
    else 
     resultado:=numero3;
    --raise notice "el mayor es el numero3";
    end if;
 end if;

return resultado;
END;
$body$
LANGUAGE 'plpgsql'
CREATE OR REPLACE FUNCTION envaluar_nulo(numero integer)
RETURNS boolean AS
$body$
DECLARE
     resultado boolean;
BEGIN
    resultado:=FALSE;
 if numero ISNULL then
  resultado:=TRUE;
 end if;
return resultado;
END;
$body$
LANGUAGE 'plpgsql'

CREATE OR REPLACE FUNCTION ContarLetra(letra char, cadena text) returns text as
$$
DECLARE
      i int;
	  contador int;
	   car char;
       valor text;
begin
	contador:=0;
	i:=length(cadena);
	while i>0 LOOP
    	 car:=substring(cadena,i,1);
		if car=letra then
			contador:=contador +1;
		end if;
          i:=i-1;
	end LOOP;
    valor:='la cantidad de caracteres buscados es:'||contador;
  
RETURN valor;
end;
$$
LANGUAGE plpgsql;

create FUNCTION primo(numero int)returns int as
$$
DECLARE
      aux int;
      res  int;
begin
      
      aux:=2;
     
       while aux < numero LOOP
        if (numero%aux=0) then
           raise EXCEPTION 'el numero  no es primo';
            aux:=numero+1;
            res:=0;
        else
            aux:=aux+1;
            res:=1;
        end if;
       end LOOP;
       
        if numero = 1 or numero=2 or numero=3 THEN
         res:=1;
       end if;
       if res=1 then
         raise notice 'es primo';
       end if;
       
       
       return res;
      
end;
$$
LANGUAGE plpgsql;



