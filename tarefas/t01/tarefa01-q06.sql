SELECT f.nome, f.salario, d.descricao 
from funcionario as f, departamento as d
WHERE f.cod_dep = d.codigo || f.cod_dep = NULL
