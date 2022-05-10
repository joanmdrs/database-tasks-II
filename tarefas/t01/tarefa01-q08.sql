# Criando a VIEW 
CREATE VIEW vwInfoDepartamento(departamento, gerente, projetos) 
AS SELECT d.descricao, f.nome, COUNT(p.cod_depto)
FROM departamento as d 
LEFT JOIN projeto as p
ON d.codigo = p.cod_depto
LEFT JOIN funcionario as f
ON f.codigo = p.cod_responsavel
GROUP BY d.descricao;

# Fazendo a busca
SELECT * FROM vwInfoDepartamento
