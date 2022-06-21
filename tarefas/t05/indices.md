### Conceito:

Index, ou em português Índice, é um recurso que o SQL Server disponibiliza afim de ordenar dados 
em uma determinada sequência, afim de retornar os resultados de maneira mais eficiente.

### Sintaxe: 

~~~sql
CREATE INDEX index_name ON table_name [USING method]
(
    column_name [ASC | DESC] [NULLS {FIRST | LAST }],
    ...
);

~~~

### Vamos a analisar a sintaxe :

* Primeiro, especifique o nome do índice após a cláusula CREATE INDEX . O nome do índice deve ser significativo e fácil de lembrar.
* Segundo, especifique o nome da tabela à qual o índice pertence.
* Terceiro, especifique o método de índice como uma árvore binária , hash , gist , spgist , gin e brin . 
O PostgreSQL usa uma árvore binária por padrão.
* Quarto, liste uma ou mais colunas a serem armazenadas no índice. 
* O ASC e o DESC especificam a ordem de classificação. ASC é o padrão. 
* NULLS FIRST ou NULLS LAST especifica a classificação de nulos antes ou depois de não nulo . 
O NULLS FIRST é o padrão quando DESC é especificado e NULLS LAST é o padrão quando DESC não é especificado.


### Exemplo 

A consulta a seguir encontra o endereço cujo número de telefone é 223664661973 :

~~~sql
SELECT * FROM endereço 
WHERE telefone = '223664661973';

~~~

É óbvio que o mecanismo de banco de dados teve que varrer toda a tabela de endereços 
para procurar o endereço porque não há índice disponível para a coluna de telefone.

Para mostrar o plano de consulta, use a instrução EXPLAIN da seguinte maneira:

~~~sql
EXPLAIN SELECT * 
FROM endereço 
WHERE phone = '223664661973';
~~~

Para criar um índice para os valores na coluna phone da tabela de endereços , use a seguinte instrução:

~~~sql
CREATE INDEX idx_address_phone 
ON address(phone);
~~~
