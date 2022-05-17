#7 - Crie um usuário com nome administrador e conceda a ele todos os privilégios em um banco de dados.

CREATE USER admin;

ALTER ROLE admin
	SUPERUSER
	CREATEDB
	CREATEROLE;
