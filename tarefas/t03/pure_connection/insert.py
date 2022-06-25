from datetime import date
from connect import connectDataBase
    
conn = connectDataBase()
cur = conn.cursor()


def createAtividade(codProjeto, dataFim, dataInicio, descricao):
    insert_script = '''
        INSERT INTO atividade(codprojeto, datafim, datainicio, descricao) 
        VALUES (%s, %s, %s, %s);
    '''
    insert_value = (codProjeto, dataFim, dataInicio, descricao)
    cur.execute(insert_script, insert_value)
    conn.commit()
    
createAtividade(
    codProjeto = 1,
    dataFim=date(2022, 12,15), 
    dataInicio = date(2022,6,24), 
    descricao="Fazer a lista de exercícios",
)

cur.close()
conn.close()
