from models import *
from connect import connectDatabase, closeConnection

connectDatabase()

def selectProjetoJoinAtividades():
    return Projeto.select(Projeto.codigo, Projeto.descricao, Atividade.descricao).join(Atividade).where(Projeto.codigo == Atividade.codprojeto)


query = selectProjetoJoinAtividades()

for projeto in query:
    print(projeto.codigo, "-", projeto.descricao,":", projeto.atividade.descricao)