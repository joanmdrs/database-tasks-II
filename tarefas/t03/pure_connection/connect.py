import psycopg2


#configurações

host = 'localhost'
dbname = 'tarefa03'
user = 'postgres'
password = 'postgres'
port = '5432'
conn = None
cur = None

def connectDataBase (): 
    
    try:
        conn = psycopg2.connect(
            host = host,
            dbname = dbname,
            user = user,
            password = password,
            port = port
        )
    
        return conn
        
    except Exception as error:
        print(error)
        
    # finally :
    #     if cur is not None:
    #         cur.close()
    #     if conn is not None:
    #         conn.close()

