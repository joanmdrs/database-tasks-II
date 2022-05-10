#Questão 06
SELECT f.nome, f.salario, d.descricao 
from funcionario as f LEFT JOIN departamento as d
ON f.cod_dep = d.codigo 
