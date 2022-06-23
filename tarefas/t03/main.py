import psycopg2

#configurações

host = 'localhost'
dbname = 'postgres'
user = 'postgres'
password = 'postgres'
port = '5432'
conn = None
cur = None

try:
    conn = psycopg2.connect(
        host = host,
        dbname = dbname,
        user = user,
        password = password,
        port = port
    )
    
    cur = conn.cursor()
    
    insert_script = '''
        INSERT INTO atividade(descricao, datainicio, datafim, situacao, dataconclusao) 
        VALUES (%s, %s, %s, %s, %s);
    '''
    insert_value = ('Testando 1', '2022-06-23', '2022-06-27', 'Em andamento', '2022-06-27')
    cur.execute(insert_script, insert_value)
    conn.commit()
    
    cur.close()
    conn.close()
except Exception as error:
    print(error)
    
finally :
    
    if cur is not None:
        cur.close()
    if conn is not None:
        conn.close()
