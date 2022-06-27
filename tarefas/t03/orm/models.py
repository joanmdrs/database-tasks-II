from peewee import *

database = PostgresqlDatabase('tarefa03', **{'host': 'localhost', 'port': 5432, 'user': 'postgres', 'password': 'postgres'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Funcionario(BaseModel):
    coddepto = DeferredForeignKey(column_name='coddepto', field='codigo', rel_model_name='Departamento', null=True)
    codigo = AutoField()
    codsupervisor = ForeignKeyField(column_name='codsupervisor', field='codigo', model='self', null=True)
    dtnasc = DateField(null=True)
    nome = CharField(null=True)
    salario = DecimalField(null=True)
    sexo = CharField(null=True)

    class Meta:
        table_name = 'funcionario'
        schema = 'public'

class Departamento(BaseModel):
    codgerente = ForeignKeyField(column_name='codgerente', field='codigo', model=Funcionario, null=True)
    codigo = AutoField()
    descricao = CharField(null=True)
    sigla = CharField(null=True)

    class Meta:
        table_name = 'departamento'
        schema = 'public'

class Projeto(BaseModel):
    coddepto = ForeignKeyField(column_name='coddepto', field='codigo', model=Departamento, null=True)
    codigo = AutoField()
    codresponsavel = ForeignKeyField(column_name='codresponsavel', field='codigo', model=Funcionario, null=True)
    datafim = DateField(null=True)
    datainicio = DateField(null=True)
    descricao = CharField(null=True)
    nome = CharField(null=True)

    class Meta:
        table_name = 'projeto'
        schema = 'public'

class Atividade(BaseModel):
    codigo = AutoField()
    codprojeto = ForeignKeyField(column_name='codprojeto', field='codigo', model=Projeto, null=True)
    datafim = DateField(null=True)
    datainicio = DateField(null=True)
    descricao = CharField(null=True)

    class Meta:
        table_name = 'atividade'
        schema = 'public'

