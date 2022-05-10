#Criando a VIEW 
CREATE VIEW vwInfoProjetos(funcionario, quant) 
AS SELECT f.nome, count(a.codigo)
from funcionario as f, atividade as a
WHERE f.codigo = a.cod_responsavel
GROUP by f.codigo;

#Realizando a consulta 
SELECT funcionario as "Funcionário responsável", quant as "Nº de atividades"
from vwInfoProjetos
