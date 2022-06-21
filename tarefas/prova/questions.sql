1.

CREATE SEQUENCE seq_sorte 
START 1
INCREMENT 1
MINVALUE 1
MAXVALUE 100
CYCLE;

2.

ALTER TABLE funcionario ADD COLUMN num_sorte INT DEFAULT nextval('seq_sorte');

3. 

INSERT INTO funcionario (nome, sexo, datanasc, salario, supervisor, depto, num_sorte)
VALUES ('Joan','M','2000-12-11', 5000.00, 1, 2, nextval('seq_sorte'));

4.
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


5. 


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

