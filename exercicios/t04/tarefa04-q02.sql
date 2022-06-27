/*Faça uma consulta para calcular a média de idade por departamento.*/

CREATE OR REPLACE FUNCTION averageAgeByDepartment () 
    RETURNS TABLE (
        depto int,
        media decimal(10,2)
) 
AS $$
BEGIN
   RETURN QUERY
   SELECT 
        d.codigo, 
        AVG(extract(year from age('2022-06-09',f.datanasc)))
   FROM funcionario as f, departamento as d
   WHERE f.depto = d.codigo
   GROUP BY d.codigo;
END; $$ 

LANGUAGE 'plpgsql';

SELECT * FROM averageAgeByDepartment();
