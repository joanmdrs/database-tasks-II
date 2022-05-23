# 07.Crie um gatilho que adicione mais um passageiro 
# a um voo sempre que um cliente entre em um voo. 

# Criando o TRIGGER
CREATE TRIGGER addPassengerOnFlight AFTER
INSERT ON cliente_voo
FOR EACH ROW
UPDATE voo SET num_passageiros = num_passageiros + 1
WHERE codigo = new.cod_voo;

# Inserindo um cliente
INSERT INTO cliente(nome, endereco)
VALUES("Allan Gabriel Almeida Oliveira", "Rua Ricardo Felix da Silva");

# Inserindo um voo
INSERT INTO voo(tipo, cod_piloto, num_passageiros, distancia)
VALUES ("Executivo", 1, 0, 500.00);

# Inserindo um passageiro no voo
INSERT INTO cliente_voo(cod_cliente, cod_voo, classe)
VALUES (2, 1, "Executiva");
