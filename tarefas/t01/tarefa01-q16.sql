# Questão 16

#Criando a VIEW 
CREATE VIEW vwResponsaveis(responsavel)
AS SELECT f.codigo 
from funcionario as f
WHERE f.codigo IN (SELECT cod_responsavel from projeto)

#Fazendo a consulta
SELECT f.nome, f.salario
from funcionario as f 
JOIN vwResponsaveis as vr
ON f.codigo = vr.responsavel 
and f.codigo in (SELECt cod_gerente from departamento)
or f.codigo = vr.responsavel 
AND f.salario > (SELECT f.salario from funcionario as f, departamento as d 
WHERE f.codigo = f.cod_dep
group by f.salario)
