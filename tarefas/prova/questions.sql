/* 1. Crie uma sequência cíclica que vá de 1 até 100 e incrementando em 1, chame ela de seq_sorte.*/

CREATE SEQUENCE seq_sorte 
START 1
INCREMENT 1
MINVALUE 1
MAXVALUE 100
CYCLE;

/* 2. Adicione uma coluna num_sorte a tabela funcionário e que o valor DEFAULT desta coluna seja o próximo valor desta sequência seq_sorte. */

ALTER TABLE funcionario ADD COLUMN num_sorte INT DEFAULT nextval('seq_sorte');

/* 3. Insira um novo funcionário passando explicitamente o num_sorte do funcionário com o próximo valor da sequência seq_sorte. */

INSERT INTO funcionario (nome, sexo, datanasc, salario, supervisor, depto, num_sorte)
VALUES ('Joan','M','2000-12-11', 5000.00, 1, 2, nextval('seq_sorte'));
 
/*
4. Faça uma função sem parâmetros para exibir um relatório analítico sobre os projetos que retorne uma tabela. 
A nova tabela deve exibir o código do projeto, o nome do projeto, o nome do responsável, a quantidade de atividades do projeto.
Para testar sua função use: SELECT * FROM relatiorio();
*/

CREATE OR REPLACE FUNCTION relatorio () 
    RETURNS TABLE (
        codProjeto INTEGER,
        nomeProjeto VARCHAR(45),
        nomeResponsavel VARCHAR(45),
        qtdAtividades BIGINT
) 
AS $$
BEGIN
   RETURN QUERY SELECT p.codigo, p.descricao, f.nome, COUNT(atividade.codigo)
   FROM projeto AS p 
   INNER JOIN funcionario AS f
   ON p.responsavel = f.codigo 
   INNER JOIN atividade_projeto AS ap
   ON P.codigo = ap.codprojeto
   INNER JOIN atividade 
   ON ap.codatividade = atividade.codigo
   GROUP BY p.codigo, f.nome;
   
END; $$ 

LANGUAGE 'plpgsql';


SELECT * FROM relatorio();



/* 
5. Faça uma função para calcular a quantidade de atividades de um projeto. 
A função deve receber o código do projeto e retornar uma quantidade. 
*/


CREATE OR REPLACE FUNCTION relatorio () 
    RETURNS TABLE (
        codProjeto INTEGER,
        qtdAtividades BIGINT
) 
AS $$
BEGIN
   RETURN QUERY SELECT p.codigo, COUNT(atividade.codigo)
   FROM projeto AS p, atividade_projeto AS ap, atividade
   WHERE p.codigo = ap.codprojeto AND ap.codatividade = atividade.codigo
   GROUP BY p.codigo;
   
END; $$ 

LANGUAGE 'plpgsql';

SELECT * FROM relatorio();

/* 6. Fale o que é um Índices (INDEX) e para quais atributos você criaria um índice. 

Index representa um recurso do SQL que possui a finalidade de ordenar dados
em uma determinada sequência, afim de retornar os resultados de maneira mais eficiente.
Dessa forma, o index agiliza a recuperação das linhas em uma tabela. Quando é criado um index,
o banco de dados irá criar uma estrutura de árvore ordenada para facilitar as buscas. 

Eu criaria um index para todas as chaves primárias de esquema relacional, pois são campos de grande seletividade.

Também criaria um index para os campos situacao de projeto e da atividade, 
pois se eu quiser exibir um relatório contendo a situação dos projetos e das atividades vinculadas a ele.

*/

/* 

7. Cite alguns dos tipos de índices presentes no SGBD PostgreSQL? Qual é o tipo de índice padrão do PostgreSQL? 

Resposta:

Alguns dos tipos de índices do PostgreSQL são:     
B-tree,
Hash,
GIN,
BRIN,
GIST,
SP-GIST 

O tipo de índice padrão do postgreSQL é o B-tree, o qual é o mais adequado para a maioria das situações comuns.

*/

/* 8. Faça um script para criar um índice para o atributo DataFim da tabela Atividade. */

CREATE INDEX indexDataFimAtividade
ON atividade(datafim);

/* 9.Faça um script que cria o usuário gerente_geral com senha e que tem permissão de execução uma stored procedure chamada proc_relatorio_gestao.*/
CREATE ROLE gerente_geral WITH ENCRYPTED PASSWORD 'gerente';
GRANT ALL ON PROCEDURE proc_relatorio_gestao TO gerente_geral;
