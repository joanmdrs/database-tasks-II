# Questão 05 

# SAVEPOINT
BEGIN;
INSERT INTO funcionario (nome, idade) 
VALUES ('Marinalva Azevedo', 41);
SAVEPOINT my_savepoint;
INSERT INTO funcionario (nome, idade)
VALUES ('Jean Alves', 46);
COMMIT;

# ROLLBACK TO SAVEPOINT
BEGIN;
INSERT INTO funcionario (nome, idade)
VALUES('Rauan Meirelles', 21);
SAVEPOINT my_savepoint;
INSERT INTO funcionario (nome, idade)
VALUES('Taciano Silva', 40);
ROLLBACK TO SAVEPOINT my_savepoint;
INSERT INTO funcionario (nome, idade)
VALUES('Wesley Morais', 21);
COMMIT;

# RELEASE SAVEPOINT
BEGIN;
INSERT INTO funcionario (nome, idade) 
VALUES ('Adson Santos', 21);
SAVEPOINT my_savepoint;
INSERT INTO funcionario (nome, idade)
VALUES ('Allan Gabriel', 21);
RELEASE SAVEPOINT my_savepoint;
COMMIT;
