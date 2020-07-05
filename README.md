# PetGroomerSchedule
Mobile app construído em Flutter com objetivo de manter o agendamento de serviços para clientes. A solução foi idealizada pensando em um modelo de negócio para banho & tosa canina, mas é facilmente utilizada em outros modelos de negócio.

#### Quickstart para Flutter
> https://github.com/Gadotti/FlutterExamples

## Gerencimento de estado
No Flutter existe a opção de manter os estados auto gerenciados através de componente Statefull, porém nem sempre é o que desejamos, já que isto pode trazer processamento desnecessário ou acessos excessivos à base dados, que representa custo direto para o desenvolvedor.

Neste projeto foi utilizado 100% a abordagem do **MobX** para o gerenciamento de estados. Toda as construções de tela e componentes são tratados e gerenciados desta forma.

Toda tela e componente é carregado do banco de dados e reconstruído somente quando absolutamente necessário, mantendo a tentativa de máxima otimização.

## Persistência de dados
Nesta versão, a aplicação mantém os dados no próprio dispositivo, excluíndo assim custos adicionais com gerenciamento em nuvem e funcionando 100% offline. Porém o modelo é pensado em futura adaptação para conexão com o **Firebase**, o que justifica a preocupação com a minização do acesso ao banco de dados.

## Prints
![alt text](https://github.com/Gadotti/PetGroomerSchedule/blob/master/prints/Print1.png "Agendamento")
![alt text](https://github.com/Gadotti/PetGroomerSchedule/blob/master/prints/Print2.png "Agendamento")
![alt text](https://github.com/Gadotti/PetGroomerSchedule/blob/master/prints/Print3.png "Agendamento")
![alt text](https://github.com/Gadotti/PetGroomerSchedule/blob/master/prints/Print4.png "Agendamento")
![alt text](https://github.com/Gadotti/PetGroomerSchedule/blob/master/prints/Print5.png "Agendamento")