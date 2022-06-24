from models import Atividade
from datetime import date
from connection import connectDatabase, closeConnection

connectDatabase()

def createAtividade (dataConclusao, dataFim, dataInicio, descricao, situacao) :
    Atividade.create(
        dataconclusao = dataConclusao,
        datafim = dataFim,
        datainicio = dataInicio,
        descricao = descricao,
        situacao = situacao
    )
    

# def createAtividadeProjeto(codAtividade, codProjeto):
#     AtividadeProjeto.create(
#         codatividade = codAtividade,
#         codprojeto = codProjeto
#     )
    

createAtividade(
    dataConclusao=date(2022, 12, 1), 
    dataFim=date(2022, 12,15), 
    dataInicio = date(2022,6,24), 
    descricao="Fazer a lista de exercícios",
    situacao="Em andamento"
)

closeConnection()
    