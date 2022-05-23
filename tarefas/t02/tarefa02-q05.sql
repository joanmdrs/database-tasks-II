# 05. Crie um gatilho que ao se adicionar um voo, 
# seja adicionado +1 voo para o piloto daquele voo.

# Criando o Trigger
CREATE TRIGGER addVooToPiloto AFTER 
INSERT ON voo 
FOR EACH ROW 
UPDATE piloto SET num_voos = num_voos + 1 
WHERE codigo = NEW.cod_piloto; 

# Inserindo um piloto
INSERT INTO piloto(nome, num_voos)
VALUES ("Mykael de Azevedo Medeiros", 0);

# Inserido um voo
INSERT INTO voo(tipo, cod_piloto, num_passageiros, distancia)
VALUES ("Econômico", 1, 0, 1000.00);
