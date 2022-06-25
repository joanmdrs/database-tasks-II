from connect import connectDataBase
    
conn = connectDataBase()
cur = conn.cursor()

def selectProjetoJoinAtividades():
    
    select_script = '''
        SELECT projeto.codigo, projeto.descricao, atividade.descricao
        FROM projeto INNER JOIN atividade      
        ON projeto.codigo = atividade.codprojeto;
    '''
    
    cur.execute(select_script)
    conn.commit()

selectProjetoJoinAtividades()

cur.close()
conn.close()