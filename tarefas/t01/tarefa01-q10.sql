# Questão 10
SELECT p.nome, d.descricao, f.nome
FROM funcionario as f , departamento as d , projeto as p
WHERE p.cod_depto = d.codigo and p.cod_responsavel = f.codigo 
