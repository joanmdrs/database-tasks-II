CREATE ROLE usu WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	REPLICATION;
	
ALTER ROLE usu
	RENAME TO adiministrador2;
	
ALTER ROLE adiministrador2 WITH ENCRYPTED PASSWORD 'admin2';

DROP USER adiministrador2;




