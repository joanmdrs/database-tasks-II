#Povoando a tabela funcionario
INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_dep)
VALUES("Joan de Azevedo Medeiros", 'M', '2000-12-11', 5000.00, NULL),
("Allan Gabriel Almeida Oliveira", 'M', '2000-12-31', 5500.00, NULL),
("Rauan Meirelles Dantas de Araujo", 'M', '2001-05-28', 1200.00, NULL),
("Deyse de Azevedo Paiva", 'F', '2000-05-09', 3000.00, NULL),
("Thaynara de Azevedo Luciano", 'F', '2000-12-03', 10000.00, NULL),
("Mykael de Azevedo Medeiros", 'M', '2002-06-26', 3000.00, NULL),
("Marinalva de Azevedo Santos Medeiros", 'F', '1980-07-11', 4000.00, NULL);

#Povoando a tabela departamento
INSERT INTO departamento (descricao, cod_gerente)
VALUES("Departamento de Computação e Tecnologia", 1),
("Departamento de Direito e Legislação", 5),
("Departamento de Administração e Gestão", 4),
("Departamento de Análise e Desenvolvimento", 2),
("Departamento de Matemática e Exatas", 3);

#Atualizando o código dos departamentos da tabela funcionario
UPDATE funcionario SET cod_dep = 1 WHERE codigo = 1;
UPDATE funcionario SET cod_dep = 2 WHERE codigo = 4;
UPDATE funcionario SET cod_dep = 3 WHERE codigo = 5;
UPDATE funcionario SET cod_dep = 4 WHERE codigo = 3;
UPDATE funcionario SET cod_dep = 5 WHERE codigo = 2;
UPDATE funcionario SET cod_dep = 2 WHERE codigo = 6;
UPDATE funcionario SET cod_dep = 1 WHERE codigo = 7;

#Povoando a tabela projeto
INSERT INTO projeto(nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim)
VALUES("Semana da Matemática", "Realização de oficionas e palestras na área de matemática", 5, 3, '2022-04-29', '2022-12-29'),
("Implantação de um sistema de gerenciamento de laboratórios", "Realizar o gerenciamento da equipe e dos horários em cada laboratório", 1, 1, '2022-04-29', '2022-12-29'),
("O papel do administrador nas empresas", "Se trata de um estudo de caso realizado em cinco empresas do RN", 3, 4, '2022-04-29', '2022-12-29'),
("Desenvolvimento de uma plataforma para o ensino de programação", "O projeto busca implementar um sistema Web para hospedagem de vídeos e exercícios sobre programação", 4, 2, '2022-04-29', '2022-12-29'),
("Estudo de caso: A presença feminina nos tribunais", "O projeto busca fazer um comparativo sobre a presença feminina nos tribunais nos dias de hoje em relação a 10 anos atrás", 2, 5, '2022-04-29', '2022-12-29');

#Povoando a tabela atividade
INSERT INTO atividade(nome, descricao, cod_responsavel, data_inicio, data_fim)
VALUES("Implementar os casos de uso", "Criar todos os casos de uso do sistema e documentar", 1, '2022-04-29', '2022-05-29'),
("Fazer a revisão bibliográfica", "Realizar a seleção de 10 artigos iniciais sobre o assunto", 5, '2022-04-29', '2022-05-29'),
("Selecionar os palestrantes", "Entrar em contato com os palestrantes e elaborar o plano de trabalho de cada", 3, '2022-04-29', '2022-05-29'),
("Fazer um mapeamento das empresas da região", "Montar uma tabela com todas as empresas existentes na região e selecionar as 5 mais relevantes", 4, '2022-04-29', '2022-05-29'),
("Realizar o levantamento de requisitos do sistema", "Realizar uma reunião com os stakeholders e tomar nota de todos as funções do sistema", 2, '2022-04-29', '2022-05-29');

#Povoando a tabela atividade_projeto
INSERT INTO atividade_projeto(cod_projeto, cod_atividade)
VALUES(1, 1),
(2, 3),
(3, 4),
(4, 5),
(5, 2)
