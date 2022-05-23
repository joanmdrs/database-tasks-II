# 04. Crie um gatilho que ao se adicionar um novo cliente, 
# seja criado para ele um cartão de milhagem com 0 milhas.

CREATE TRIGGER addMileageCard AFTER 
INSERT ON cliente 
FOR EACH ROW 
INSERT INTO milhas(cod_cliente, quantidade)
VALUES (NEW.codigo, 0); 
