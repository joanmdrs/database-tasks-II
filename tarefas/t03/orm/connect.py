from models import database

def connectDatabase():
    database.connect()
    
def closeConnection():
    database.close()