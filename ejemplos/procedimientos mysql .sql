create procedure cambiando(IN parametro int)
begin
      IF parametro = 1 THEN
         set @numero = 1;
      ELSE
         set @numero = parametro;
      end if;
         
end

