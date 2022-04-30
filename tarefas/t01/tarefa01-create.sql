#Table Funcionario
CREATE TABLE funcionario(
  codigo INT AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL, 
  sexo char,
  dt_nasc DATE, 
  salario DECIMAL(10,2),
  
  PRIMARY key (codigo)
);

#Table Departamento
CREATE TABLE departamento(
  codigo int AUTO_INCREMENT,
  descricao VARCHAR(500), 
  cod_gerente int,
  
  PRIMARY KEY (codigo),
  FOREIGN KEY (cod_gerente) 
  REFERENCES funcionario(codigo) 
                      
);

#Adicionando a coluna cod_dep e definindo-a como chave estrangeira
ALTER TABLE funcionario ADD COLUMN cod_dep INT;
ALTER TABLE funcionario ADD FOREIGN KEY (cod_dep) REFERENCES departamento(codigo);

#Table projeto
CREATE TABLE projeto (
  codigo INT AUTO_INCREMENT, 
  nome VARCHAR(100) NOT NULL, 
  descricao VARCHAR(500) NOT NULL, 
  cod_depto int, 
  cod_responsavel INT, 
  data_inicio DATE, 
  data_fim DATE,
  
  PRIMARY KEY(codigo),
  FOREIGN KEY(cod_depto) REFERENCES departamento(codigo),
  FOREIGN KEY(cod_responsavel) REFERENCES funcionario(codigo)
  
);

#Table atividade
CREATE TABLE atividade(
  codigo INT AUTO_INCREMENT, 
  nome VARCHAR(100) NOT NULL, 
  descricao VARCHAR(500) NOT NULL, 
  cod_responsavel INT, 
  data_inicio DATE, 
  data_fim DATE,
  
  PRIMARY KEY(codigo),
  FOREIGN KEY(cod_responsavel) REFERENCES funcionario(codigo)
);

#Table atividade_projeto
CREATE TABLE atividade_projeto(
  cod_projeto INT, 
  cod_atividade INT,

  PRIMARY key(cod_projeto, cod_atividade),
  FOREIGN KEY(cod_projeto) REFERENCES projeto(codigo),
  FOREIGN KEY(cod_atividade) REFERENCES atividade(codigo)
  
);
