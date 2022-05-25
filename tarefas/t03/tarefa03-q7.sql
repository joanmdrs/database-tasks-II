CREATE ROLE adiministrador;
 
/*CREATE USER é agora um alias para CREATE ROLE, que tem mais recursos.*/

ALTER ROLE adiministrador
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	REPLICATION;