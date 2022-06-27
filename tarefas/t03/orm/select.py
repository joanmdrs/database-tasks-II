from models import *
from connect import connectDatabase, closeConnection

connectDatabase()

def selectProjetoJoinAtividades():
    return Projeto.select(
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
        ).join(Atividade).where(Projeto.codigo == Atividade.codprojeto)


query = selectProjetoJoinAtividades()

print("%-97s | %-20s" %('Projeto', 'Atividade'))
print("%173s" %("-"*173))
for projeto in query:
    print("%-4d %-15s %-40s %4s %4s %12s %12s | %-4d %-35s %4s %12s %12s" % (
        projeto.codigo,
        projeto.nome, 
        projeto.descricao,
        str(projeto.codresponsavel),
        str(projeto.coddepto),
        projeto.datainicio.strftime("%d/%m/%Y"), 
        projeto.datafim.strftime("%d/%m/%Y"),
        projeto.atividade.codigo,
        projeto.atividade.descricao,
        str(projeto.atividade.codprojeto),
        projeto.atividade.datainicio.strftime("%d/%m/%Y"), 
        projeto.atividade.datafim.strftime("%d/%m/%Y"),
    ))
        
        
        
        
    