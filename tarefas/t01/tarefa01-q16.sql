# Questão 16
SELECT f.nome
from funcionario as f, vwResponsavel as vr
WHERE f.codigo = vr.responsavel 
and f.codigo in (SELECt cod_gerente from departamento)
or f.codigo = vr.responsavel 
AND f.salario > (SELECT f.salario from funcionario as f, departamento as d 
WHERE f.codigo = f.cod_dep
group by f.salario)
