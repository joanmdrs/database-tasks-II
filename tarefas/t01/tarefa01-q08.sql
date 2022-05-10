# Criando a VIEW 
CREATE VIEW vwProjetos(gerente, departamento, quant_projetos) AS
SELECT d.cod_gerente, d.descricao, COUNT(p.codigo)
FROM departamento as d, projeto as p
WHERE d.codigo = p.cod_depto
GROUP BY d.descricao, d.cod_gerente;

# Fazendo a busca
SELECT f.nome, departamento,  quant_projetos
FROM funcionario as f, vwProjetos as vp
WHERE f.codigo = vp.gerente
