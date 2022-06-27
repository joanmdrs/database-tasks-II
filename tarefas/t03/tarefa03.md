## Scripts

### ODBC 

- [Conexão ODBC](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/odbc/connect.py)
- [Questão 05 - Letra a)](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/odbc/insert.py)
- [Questão 05 - Letra b)](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/odbc/update.py)
- [Questão 05 - Letra c)](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/odbc/select.py)

### ORM 

- [Models](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/orm/models.py)
- [Conexão ORM](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/orm/connect.py)
- [Questão 06 - Letra a)](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/orm/insert.py)
- [Questão 06 - Letra b)](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/orm/update.py)
- [Questão 06 - Letra c)](https://github.com/joanmdrs/database-tasks-II/blob/main/tarefas/t03/orm/select.py)



## Resumo sobre ODBC na linguagem que escolheu

<p align="justify">
  Resumidamente, um ODBC se trata de uma especificação para uma API de banco de dados. Diante disso, o python, que foi a linguagem escolhida,
  possui uma especificação chamada Python DB API 2.0. Essa especificação foi projetada para fornecer uma interface consistente para vários bancos
  de dados e ajudar os desenvolvedores a escrever aplicativos que podem funcionar com diferentes bancos de dados sem alterações significativas 
  no código. Um módulo ODBC do Python permite organizar um código logicamente que o torna mais fácil de entender e usar.
  Para se conectar a um banco de dados e recuperar dados usando a linguagem de programação Python, você precisa apenas de algumas funções:
</p>

- função connect() para criar uma conexão com o banco de dados;
- função cursor() para criar um cursor a partir da conexão;
- função execute() para executar uma instrução select;
- fetchone() para recuperar linhas da consulta.

## Resumo sobre ORM na linguagem que escolheu

<p align="justify">
  Object-Relational Mapping (ORM) ou mapeamento objeto-relacional, é uma técnica para aproximar o paradigma de desenvolvimento de aplicações
  orientadas a objetos ao paradigma do banco de dados relacional. O uso da técnica de mapeamento objeto-relacional é realizado através de um 
  mapeador objeto-relacional que geralmente é a biblioteca ou framework que ajuda no mapeamento e uso do banco de dados.
  
</p>

<p align="justify">
  O Python é uma linguagem de programação orientada a objetos (OO) de alto nível com muitas bibliotecas prontas projetadas para resolver problemas
  específicos. Diante disso, o Python por ser uma linguagem OO, permite a utilização de ORMs, facilitando assim a escrita de código SQL por meio de
  funções prontas disponíveis em uma biblioteca. O que o ORM faz é, basicamente, transformar classes Python em tabelas no banco de dados, além de 
  permitir construir querys usando diretamente objetos Python ao invés de SQL.
</p>

## Peewee ORM

<p align="justify">
  Peewee é um ORM destinado a criar e gerenciar tabelas de banco de dados relacionais através de objetos Python. 
</p>


<p align="justify">
  O Peewee é destinado a projetos de pequeno/médio porte e se destaca pela simplicidade quando comparado a outros ORM mais conhecidos,
  como o SQLAlchemy. O autor da API do Pewee fez uma analogia onde ele menciona que o Peewee está para o SQLAlchemy assim como SQLite está 
  para o PostgreSQL.
</p>


<p align="justify">
  Em relação aos recursos por ele oferecidos, podemos citar que ele possui suporte nativo a SQLite, PostgreSQL e MySQL, embora seja 
  necessário a instalação de drivers para utilizá-lo com PostgreSQL e MySQL e suporta tanto Python 2.6+ quanto Python 3.4+.
</p>


