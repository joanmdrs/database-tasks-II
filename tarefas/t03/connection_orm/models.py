from peewee import *
import sys 

database = PostgresqlDatabase('postgres', host='localhost', port=5432, user = 'postgres', password = 'postgres')

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Atividade(BaseModel):
    codigo = AutoField()
    dataconclusao = DateField(null=True)
    datafim = DateField(null=True)
    datainicio = DateField(null=True)
    descricao = CharField(constraints=[SQL("DEFAULT 'NULL::character varying'")], null=True)
    situacao = CharField(constraints=[SQL("DEFAULT 'NULL::character varying'")], null=True)

    class Meta:
        table_name = 'atividade'
        schema = 'public'

class Equipe(BaseModel):
    codigo = AutoField()
    nomeequipe = CharField(constraints=[SQL("DEFAULT 'NULL::character varying'")], null=True)

    class Meta:
        table_name = 'equipe'
        schema = 'public'


# # Possible reference cycle: funcionario
# class Departamento(BaseModel):
#     codigo = AutoField()
#     descricao = CharField()
#     gerente = ForeignKeyField(column_name='gerente', field='codigo', model=Funcionario, null=True)
#     sigla = CharField(unique=True)

#     class Meta:
#         table_name = 'departamento'
#         schema = 'public'

# class Funcionario(BaseModel):
#     codigo = AutoField()
#     datanasc = DateField(null=True)
#     depto = ForeignKeyField(column_name='depto', field='codigo', model=Departamento, null=True)
#     nome = CharField()
#     salario = DecimalField(constraints=[SQL("DEFAULT NULL::numeric")], null=True)
#     sexo = CharField(constraints=[SQL("DEFAULT 'NULL::bpchar'")], null=True)
#     supervisor = ForeignKeyField(column_name='supervisor', field='codigo', model='self', null=True)

#     class Meta:
#         table_name = 'funcionario'
#         schema = 'public'

# class Membro(BaseModel):
#     codequipe = ForeignKeyField(column_name='codequipe', field='codigo', model=Equipe, null=True)
#     codfuncionario = ForeignKeyField(column_name='codfuncionario', field='codigo', model=Funcionario, null=True)
#     codigo = AutoField()

#     class Meta:
#         table_name = 'membro'
#         schema = 'public'

# class AtividadeMembro(BaseModel):
#     codatividade = ForeignKeyField(column_name='codatividade', field='codigo', model=Atividade)
#     codmembro = ForeignKeyField(column_name='codmembro', field='codigo', model=Membro)

#     class Meta:
#         table_name = 'atividade_membro'
#         indexes = (
#             (('codatividade', 'codmembro'), True),
#         )
#         schema = 'public'
#         primary_key = CompositeKey('codatividade', 'codmembro')

# class Projeto(BaseModel):
#     codigo = AutoField()
#     dataconclusao = DateField(null=True)
#     datafim = DateField(null=True)
#     datainicio = DateField(null=True)
#     depto = ForeignKeyField(column_name='depto', field='codigo', model=Departamento, null=True)
#     descricao = CharField(constraints=[SQL("DEFAULT 'NULL::character varying'")], null=True)
#     equipe = ForeignKeyField(column_name='equipe', field='codigo', model=Equipe, null=True)
#     responsavel = ForeignKeyField(column_name='responsavel', field='codigo', model=Funcionario, null=True)
#     situacao = CharField(constraints=[SQL("DEFAULT 'NULL::character varying'")], null=True)

#     class Meta:
#         table_name = 'projeto'
#         schema = 'public'

# class AtividadeProjeto(BaseModel):
#     codatividade = ForeignKeyField(column_name='codatividade', field='codigo', model=Atividade)
#     codprojeto = ForeignKeyField(column_name='codprojeto', field='codigo', model=Projeto)

#     class Meta:
#         table_name = 'atividade_projeto'
#         indexes = (
#             (('codprojeto', 'codatividade'), True),
#         )
#         schema = 'public'
#         primary_key = CompositeKey('codatividade', 'codprojeto')

class Cliente(BaseModel):
    codigo = AutoField()
    endereco = CharField(null=True)
    nome = CharField(null=True)

    class Meta:
        table_name = 'cliente'
        schema = 'public'

class Piloto(BaseModel):
    codigo = AutoField()
    nome = CharField(null=True)
    num_voos = IntegerField(null=True)

    class Meta:
        table_name = 'piloto'
        schema = 'public'

class Voo(BaseModel):
    cod_piloto = ForeignKeyField(column_name='cod_piloto', field='codigo', model=Piloto, null=True)
    codigo = AutoField()
    distancia = DecimalField(null=True)
    num_passageiros = IntegerField(null=True)
    tipo = CharField(null=True)

    class Meta:
        table_name = 'voo'
        schema = 'public'

class ClienteVoo(BaseModel):
    classe = CharField(null=True)
    cod_cliente = ForeignKeyField(column_name='cod_cliente', field='codigo', model=Cliente)
    cod_voo = ForeignKeyField(column_name='cod_voo', field='codigo', model=Voo)

    class Meta:
        table_name = 'cliente_voo'
        indexes = (
            (('cod_cliente', 'cod_voo'), True),
        )
        schema = 'public'
        primary_key = CompositeKey('cod_cliente', 'cod_voo')

class Milhas(BaseModel):
    cod_cliente = ForeignKeyField(column_name='cod_cliente', field='codigo', model=Cliente)
    quantidade = IntegerField()

    class Meta:
        table_name = 'milhas'
        indexes = (
            (('cod_cliente', 'quantidade'), True),
        )
        schema = 'public'
        primary_key = CompositeKey('cod_cliente', 'quantidade')
        
