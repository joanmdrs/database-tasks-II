#Questão 18
#Criando a VIEW 
CREATE VIEW vwInfoFuncionario (salario, codDepto)
AS SELECT MAX(f.salario), d.codigo
from funcionario as f, departamento as d 
WHERE f.cod_dep = d.codigo
GROUP BY d.codigo;

#Fazendo a consulta
SELECT f.nome, d.descricao
FROM funcionario as f, departamento as d, vwInfoFuncionario as vf
WHERE f.cod_dep = vf.codDepto 
and f.salario = vf.salario
and d.codigo = vf.codDepto
GROUP BY f.nome;
