from connect import connectDataBase
    
conn = connectDataBase()
cur = conn.cursor()

def updateResponsavelProjeto(codProjeto, novoResponsavel):
    
    update_script = '''
        UPDATE projeto SET codresponsavel = %s
        WHERE codigo = %s;
    '''
    update_value = (novoResponsavel, codProjeto)
    cur.execute(update_script, update_value)
    conn.commit()

updateResponsavelProjeto(codProjeto=2, novoResponsavel=4)

cur.close()
conn.close()