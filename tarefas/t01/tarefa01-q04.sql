#Questão 04
SELECT nome, salario, cod_dep
from funcionario 
WHERE codigo NOT IN (SELECT cod_gerente from departamento)
