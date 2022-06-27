from connect import connectDataBase
    
conn = connectDataBase()
cur = conn.cursor()

def selectProjetoJoinAtividades():
    
    select_script = '''
        SELECT 
            Projeto.codigo,
            Projeto.nome, 
            Projeto.descricao,
            Projeto.codresponsavel,
            Projeto.coddepto,
            Projeto.datainicio, 
            Projeto.datafim,
            Atividade.codigo,
            Atividade.descricao,
            Atividade.codprojeto,
            Atividade.datainicio, 
            Atividade.datafim
        FROM Projeto INNER JOIN Atividade      
        ON Projeto.codigo = Atividade.codprojeto;
    '''
    
    cur.execute(select_script)
    conn.commit()
    
    records = cur.fetchall()
    return records
    
   

results = selectProjetoJoinAtividades()

for row in results:
    print(row)

cur.close()
conn.close()