/*Faça uma consulta para calcular a média de idade por departamento.*/

create function calcMediaAgeDep()
returns decimal(10,2)
language plpgsql
as
$$
declare
   media decimal(10,2);
begin
   select avg(extract(year from age('2022-06-09',funcionario.datanasc))) 
   into media
   from funcionario, departamento
   where funcionario.depto = departamento.codigo;
   
   return media;
end;
$$;

select calcMediaAgeDep();
