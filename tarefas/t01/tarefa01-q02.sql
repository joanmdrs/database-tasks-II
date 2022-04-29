#Questão 02
SELECT nome FROM funcionario 
where dt_nasc > (SELECT MIN(dt_nasc) FROM funcionario)
