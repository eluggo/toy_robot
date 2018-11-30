# Descrição dos Commits
Este arquivo irá conter descrições do que foi feito em cada commit do projeto pra ajudar que estiver começando após os primeiros encontros.
Sugiro sempre que execute as alterações ao invés de clonar este projeto, mesmo que use este código como exemplo.
É interessante o exercício de digitar código na linguagem para fixar a sintaxe na memório no processo de aprendizado.

## Initial Commit
Basicamente este commit é o resultado do comando `mix new --sup toy_robot`.
A unica exceção é o arquivo [readme](./README.md) com a descrição do problema para facilitar a consulta durante a implementação.
Para mais detalhes sobre as flags e o comando new basta executar o comando `mix help new`.

## Add Robot basic commands
Neste commit criamos o módulo `ToyRobot.Robot` para implementar de forma mais básica as funções que representam os comandos que o robô aceita:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```
Desta forma temos as funções `place/3`, `move/1`, `left/1`, `right/1`, `report/1`.
Para estabelecer uma forma de contrato entre as funções foi definido o struct `%ToyRobot.Robot{}` que neste ponto possui os campos `position` e `facing`.
`position` é usado com uma tupla `{x, y}`, que presenta a posição do robô nos eixos x e y.
`facing` representa a direção que o robô está virado, aqui usamos os átomos `:north`, `:west`, `:south`, `:east`.
Neste momento não estamos preocupados com restrições para execução destes comandos.

## Basic Constraints
Neste commit o foco foi resolver apenas uma restrição em relação aos commandos:
* A robot that is not on the table can choose to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.

Para atingir esse objetivo foi adicionado o campo `placed` ao struct `%ToyRobot.Robot{}`.
Neste cenário, usamos o padrão de resposta do Elixir/Erlang com a tupla `{:ok, result} | {:error, reason}`.
Por isso refatoramos as funções `place/3`, `move/1`, `left/1`, `right/1`, `report/1` para aderir a esse comportamento.
O principal objetivo aqui é ter uma api consistente, então mesmo quando as outras restrições forem tratadas o padrão de resposta do meu robô será consistente.
Por isso mesmo que a função `place/3` terá seu comportamento alterado, mesmo não sendo afetada por esta restrição.

Os próximos commits serão tratados no próximo meetup.
