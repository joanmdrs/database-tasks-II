# 09. Cadastre um cartão de milhagem para um cliente
# qualquer e logo após crie um gatilho que cadastre um 
# cartão de milhagem para aquele cliente quando suas 
# informações forem atualizadas. Veja e explique o que 
# acontece quando esse procedimento for realizado.

# Cadastrando um cartão de milhagem para o cliente de código = 1
INSERT INTO milhas(cod_cliente, quantidade)
VALUES (1,  10);

# Criando o TRIGGER
CREATE TRIGGER addMileageCardWhenUpdatingCustomer AFTER
UPDATE ON cliente
FOR EACH ROW 
INSERT INTO milhas(cod_cliente, quantidade)
VALUES(OLD.codigo, 0) ;

# Atualizando o cliente de código = 1
UPDATE cliente SET endereco = "Rua Maria Etelvina de Azevedo"
WHERE cliente.codigo = 1;

# Após atualizar as informações do cliente, é criado um novo cartão 
# de milhagem para aquele cliente.
