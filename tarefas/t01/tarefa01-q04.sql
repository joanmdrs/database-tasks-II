#Questão 04
SELECT f.nome, f.salario, d.descricao, d.codigo
from funcionario as f
INNER JOIN departamento as d
where f.codigo <> d.cod_gerente and d.codigo = f.cod_dep
