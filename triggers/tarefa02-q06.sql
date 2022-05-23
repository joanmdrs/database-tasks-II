# 06. Crie um gatilho que some milhas ao cartão de milhagem 
# sempre que um cliente é adicionado a um voo. (considere que
# é adicionado 1 milha no cartão para cada 10 milhas de distância 
# percorrida em um voo).

# Criando o Trigger
create trigger sumMileages after
insert ON cliente_voo
FOR EACH ROW
UPDATE milhas SET quantidade = quantidade + 
(SELECT distancia FROM voo, cliente_voo 
WHERE NEW.cod_voo = voo.codigo
) / 10
WHERE cod_cliente = new.cod_cliente;

# Adicionando o cliente de codigo = 1 no voo de codigo = 1
INSERT INTO cliente_voo(cod_cliente, cod_voo, classe)
VALUES (1, 1, "Executiva");

# Fazendo a busca das milhas do cliente de codigo = 1
SELECT * FROM milhas 
WHERE cod_cliente = 1;



