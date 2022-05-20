# 04. Crie um gatilho que ao se adicionar um novo cliente, 
# seja criado para ele um cartão de milhagem com 0 milhas.

CREATE TRIGGER addCartaoMilhas AFTER 
INSERT ON cliente 
FOR EACH ROW 
INSERT INTO milhas(cod_cliente, quantidade)
VALUES (NEW.codigo, 0); 

INSERT INTO cliente(nome, endereco)
VALUES ("Joan Medeiros", "Rua Ricardo Felix da Silva, Penedo, 554, apto 402, Caicó/RN");
