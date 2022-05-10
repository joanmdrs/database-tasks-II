#Questão 18
SELECT f.nome, d.descricao from funcionario as f
LEFT JOIN departamento as d 
ON f.cod_dep = d.codigo
Group by f.cod_dep 
ORDER by f.salario
