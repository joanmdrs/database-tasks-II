#Questão 04
SELECT f.nome, f.salario, f.cod_dep
from funcionario as f
WHERE f.codigo NOT IN (SELECT cod_gerente from departamento) 
ORDER BY f.codigo
