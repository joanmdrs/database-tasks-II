### Questão 02

<p align="justify"> 
  O modelo ACID estabelece quatro objetivos que todo sistema de gerenciamento de banco de dados 
  deve se esforçar para atingir: atomicidade, consistência, isolamento e durabilidade.
</p> 

- <p align="justify"> A atomicidade afirma que as modificações do banco de dados devem seguir uma regra de “tudo ou nada”. 
  Cada transação é considerada atômica. Se uma parte da transação falhar, toda a transação falhará. É 
  fundamental que o sistema de gerenciamento de banco de dados mantenha a natureza atômica das transações, 
  apesar de qualquer SGBD, sistema operacional ou falha de hardware. </p>

- <p align="justify"> A consistência indica que apenas dados válidos serão gravados no banco de dados. Se, por algum motivo, 
  for executada uma transação que viole as regras de consistência do banco de dados, toda a transação será 
  revertida e o banco de dados será restaurado a um estado consistente com essas regras. Por outro lado, 
  se uma transação for executada com sucesso, ela levará o banco de dados de um estado que seja consistente
  com as regras para outro estado que também seja consistente com as regras. </p>

- <p align="justify"> O isolamento requer que várias transações ocorrendo ao mesmo tempo não afetem a execução
  umas das outras. Por exemplo, se Joe emitir uma transação em um banco de dados ao mesmo tempo que Mary emite
  uma transação diferente, ambas as transações devem operar no banco de dados de maneira isolada. O banco de dados
  deve realizar a transação inteira de Joe antes de executar a de Mary ou vice-versa. Isso evita que a transação
  de Joe leia os dados intermediários produzidos como um efeito colateral de parte da transação de Mary que 
  não será eventualmente confirmada no banco de dados. Observe que a propriedade de isolamento não garante 
  qual transação será executada primeiro – apenas que as transações não interferirão umas nas outras. </p>

- <p align="justify"> A durabilidade garante que qualquer transação confirmada no banco de dados não será perdida. 
  A durabilidade é garantida por meio do uso de backups de banco de dados e logs de transações que facilitam a 
  restauração de transações confirmadas, apesar de quaisquer falhas subsequentes de software ou hardware. </p>
