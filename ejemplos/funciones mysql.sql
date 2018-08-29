CREATE FUNCTION ContarLetra(cadena text,letra char ) returns int
begin
	declare i int;
	declare contador int;
	declare car char;
	set contador=0;
	set i=length(cadena);
	while i>0 do
    	set car=substring(cadena,i,1);
		if car=letra then
			set contador=contador +1;
		end if;
        set i=i-1;
	end while;
RETURN contador;
end
create FUNCTION primo(numero int)returns int
begin
      declare aux int;
      declare res  int;
      set aux=2;
     
       while aux < numero do
        if (numero%aux=0) then
            set aux=numero+1;
            set res=0;
        else
           set aux=aux+1;
           set res=1;
        end if;
       end while;
        if numero = 1 or numero=2 or numero=3 THEN
        set res=1;
       end if;
       return res;
      
end
create FUNCTION factorial(numero int)returns int
begin
      declare aux int;
      declare res  int;
      set res=1;
      set aux=1;
     
       while aux <= numero do
           set res=res*aux;
           set aux=aux+1;
       end while;
       return res;
      
end
create FUNCTION evaluar(numero int)returns text
begin
      declare res text;
      set res='';
      if(`primo`(numero)=1)then
       set res=concat('el factorial es :',`factorial`(numero)); 
      else
       set res=concat('el numero ',numero,'no es primo'); 
      end if;
       return res;
end