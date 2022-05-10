#Questão 12
SELECT 
    p.nome, 
    p.data_inicio, 
    p.data_fim, 
    a.descricao, 
    a.data_inicio, 
    a.data_fim
from 
    projeto as p, 
    atividade as a, 
    atividade_projeto as ap
WHERE 
    p.codigo = ap.cod_projeto 
    and a.codigo = ap.cod_atividade
