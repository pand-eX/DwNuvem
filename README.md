# Implementando um Data Warehouse na nuvem com Amazon Redshift AWS!!

[![NPM](https://img.shields.io/npm/l/react)](https://github.com/pand-eX/DwNuvem/blob/main/LICENSE) 

# Sobre o projeto

-Seria possível montar um Data Warehouse para armazenamento e processamento de Petabytes de dados em apenas alguns cliques? 

R: Sim! Com amazon Redshift.

-Você viu o trabalho que foi montar um Data Warehouse on premises com Oracle. E olha que montamos um ambiente controlado um ambiente pequeno um ambiente em minha máquina Virtual.

-Agora vamos para o ambiente em nuvem com alguns clicks teremos um Data Warehouse operacional com cluster com segurança e pronto para processar tetabytes de dados e um custo na maioria dos casos muito menor em relação dos casos com on premises ou seja não da para ignorar que cloud computing é a evolução da área de Tecnologia.



## Why?

por que sabemos que Computação em Nuvem é o futuro da área de TI. 

-Este projeto faz parte do meu portfólio pessoal, então, eu vou ficar feliz se você pudesse me fornecer qualquer feedback sobre o projeto, código, estrutura ou qualquer coisa que você possa relatar que poderia me fazer um engenheiro de dados melhor!

Email-me: henricao_7@yahoo.com.br

Connect with me at [LinkedIn](https://www.linkedin.com/in/henrique-castro-484269203//).

## Quero deixar 3 livros guias gratuitos no kindle sobre Amazon Redshift AWS e também um link com documentação da linguagem SQL usada no Amazon Redshift !!!

https://docs.aws.amazon.com/pt_br/redshift/latest/dg/cm_chap_SQLCommandRef.html

![1](https://github.com/pand-eX/DwNuvem/blob/main/assets/1.png)


## Atenção!!!

-Nós vamos trabalhar com operação do Data Warehouse, vamos criar um Squema, carregar alguns dados e vamos executar algumas Query é importante que você considere a mudança de paradigma é um procedimento bem diferente não temos mais que nos preocupar com arquivos de configuração, Infraestrutura com Sistema operacional com instalação de software eu simplismente clico em uma página WEB habilito o Data Warehouse defino algumas regras e conecto, carrego meus dados e começo a operação de consulta!!! Let's Go !

## Iniciando o projeto

Neste  segundo  projeto  de  implementação  de  um  Data Warehouse, trabalharemos com o ambiente em nuvem da Amazon e com o serviço Amazon Redshift. Vamos implementar um cluster com 3 nós, sendo um líder e dois compute nodes. Nosso cluster terá apenas um banco de dados. Criaremos as tabelas FATO e DIMENSÃO e iremos carregar apenas algumas tabelas.
Os scripts usados no projeto estão em anexo e em ordem!!!

## Conceito Básicos!

![12](https://github.com/pand-eX/DwNuvem/blob/main/assets/12.png)

Um cluster do Amazon Redshift consiste em nós. Cada cluster tem um nó de liderança e um ou mais nós de computação. O nó de liderança recebe consultas de aplicativos cliente, analisa as consultas e desenvolve planos de execução de consulta. Em seguida, o nó principal coordena a execução paralela desses planos com os nós de computação e agrega os resultados intermediários desses nós. Então, ele retorna os resultados de volta para os aplicativos cliente. Nós de computação executam planos de execução de consultas e 
transmitem dados entre si para atender essas consultas. Os resultados intermediários são enviados ao nó de liderança para agregação antes de serem enviados novamente para os aplicativos clientes.Quando você executa um cluster, uma opção que você especifica é o tipo de nó. O tipo de nó determina a CPU, RAM, capacidade de armazenamento e o tipo de unidade de armazenamento de cada nó. Os nós do tipo armazenamento denso (DS) são otimizados para armazenamento. Os nós do tipo computação densa (DC) são otimizados para computação. Você pode criar um cluster usando tipos de nós de armazenamento denso (DS) ou computação densa (DC). Os tipos de nós de armazenamento denso permitem criar data warehouses muito grandes usando discos rígidos (HDDs) por um preço bastante reduzido. Os tipos de nós de computação densa permitem criar data warehouses de altíssimo desempenho usando CPUs rápidas, grandes quantidades de RAM e discos de estado sólido (SSDs). Os nós do tipo DS2 são otimizados para grandes cargas de trabalho de dados e usam armazenamento com base em unidade de disco rígido (HDD). Os nós DC1 e DC2 são otimizados para cargas de trabalho de desempenho intensivo. Como eles usam armazenamento de disco de estadosólido (SSD), os tipos de nó DC1 e DC2 fornecem uma E/S muito mais rápida em comparação aos nós do tipo DS, mas fornecem menos espaço de armazenamento. Você executa clusters que usam
os tipos de nó DC2 em uma nuvem privada virtual (VPC). Você não pode executar clusters DC2 no modo EC2 clássico. O tipo de nó escolhido depende intensamente de três informações:

• A quantidade de dados que você importa para o Amazon Redshift
• A complexidade das consultas e operações que você executa no banco de 
dados
• As necessidades de sistemas downstream que dependem dos resultados 
dessas consultas e operações

Os tipos de nó estão disponíveis em diferentes tamanhos. Os nós DS2 estão disponíveis nos tamanhos xlarge e 8xlarge. Os nós DC2 estão disponíveis nos tamanhos large e 8xlarge. O tamanho do nó e o número de nós determinam o armazenamento total de um cluster. Alguns tipos de nó permitem um nó (single-node) ou dois ou mais nós (multi-node). A quantidade mínima para clusters 8xlarge são dois nós. Em um cluster de single-node, o nó é compartilhado para a funcionalidade principal e de computação. Em um cluster de multi-node, o nó de liderança é separado dos nós de computação.O Amazon Redshift aplica cotas aos recursos para cada conta da AWS em cada região. Uma cota restringe o número de recursos que sua conta pode criar para determinados tipos de recursos, como nós ou Snapshots, em uma região.

## Banco de dados no Cluster Amazon Redshift

O Amazon Redshift cria um banco de dados quando você provisiona um cluster. Este é o banco de dados que você usa para carregar dados e executar consultas em seus dados. Você pode criar bancos de dados adicionais executando um comando SQL, conforme necessário. O limite é de até 60 bancos de dados por cluster. Quando você provisiona um cluster, especifica um usuário principal que tem acesso a todos os bancos de dados criados no cluster. Este usuário principal é um superusuário que é, inicialmente, o único usuário com acesso ao banco de dados, embora esse usuário possa criar outros superusuários e usuários. O Amazon Redshift usa parameter groups para definir o comportamento de todos os bancos de dados em um cluster, tais como estilo de apresentação de data e a precisão de ponto flutuante. Se você não especificar um parameter group ao provisionar seu cluster, o Amazon Redshift associará um parameter group padrão ao cluster.

## Arquitetura do Data Warehouse com Amazon Redshift 

Configurar um Data Warehouse requer duas grandes etapas de trabalho:
1- Modelagem
2- Infraestrutura

Com relação à modelagem, os procedimentos são os mesmos independentemente da implementação on-premise ou em nuvem. Todas as etapas como definição do problema de negócio, business case, especificação, modelagem lógica, dimensional e física, seguem os mesmos padrões uma vez que estamos tratando do design do DW. Já com relação à infraestrutura, as diferenças entre implementação on-premise e em nuvem são grandes, pois se trata de “mundos” diferentes com abordagens e custos diferentes. A escolha por uma opção ou outra, depende de diversos fatores e uma escolha profissional requer uma avaliação 360 graus. Em uma implementação de DW em nuvem, a arquitetura envolve fatores além do serviço em nuvem sendo utilizado (Amazon Redshift em nosso caso), pois precisamos definir níveis de acesso e segurança, armazenamento, backup, integração, ETL, custos de transferência de dados, largura de banda para acesso aos serviços em nuvem, etc... Tudo isso deve ser levado em consideração para que o custo de uma implementação em nuvem justifique sua utilização.Embora existam outras opções, podemos falar especificamente da AWS, uma vez que estamos usando este serviço aqui em nosso projeto. Além do Amazon Redshift, uma implementação de DW em nuvem (normalmente) requer o uso de outros serviços AWS, tais como:

• S3 (Simple Storage Service)

• VPC (Virtual Private Cloud)

• EIP (Elastic IP)

• Cloud Watch

• IAM (Identity and Access Management)

Destes 5 serviços, apenas o IAM não possui custo. Embora seja possível usar uma Default VPC (como você verá durante as próximas aulas), qualquer customização poderá gerar cobranças adicionais. Armazenamento com o S3 (para colocar os arquivos que serão carregados no DW), EIP (para ter um IP exclusivo) e Cloud Watch (para monitoramento e alarmes) não são obrigatórios em uma implementação do Amazon Redshift, mas podem ajudar colaboram para tornar a experiência em nuvem bem mais profissional. A arquitetura do DW na AWS, pode ainda ser dividida em duas etapas. Primeiro a arquitetura do Cluster Amazon Redshift (conforme imagem abaixo). O número de compute nodes determina o custo do cluster e deve ser avaliado com cuidado. 
![13](https://github.com/pand-eX/DwNuvem/blob/main/assets/13.png)


Em segundo, a arquitetura de acesso ao Cluster Amazon Redshift, para que os usuários tenham acesso ao DW, conforme imagem abaixo:

![14](https://github.com/pand-eX/DwNuvem/blob/main/assets/14.png)

Neste momento, outros serviços AWS devem ser considerados. O VPN Gateway permite criar uma conexão segura entre o escritório da empresa e o ambiente AWS, mas também é um serviço AWS com custo à parte do Redshift. É função do Engenheiro de Dados pensar na melhor arquitetura para o projeto, visando reduzir custos e otimizar a utilização de recursos. Embora seja possível usar o Redshift apenas por um período de tempo e pagar pelas horas deuso, nem todos os serviços seguem este mesmo padrão (não faz sentido gravar e apagar dados no S3 por exemplo, sendo o ideal usar suas funcionalidades de versionamento). Arquiteturas mais avançadas podem requerer o uso de serviços de mensageria, como o AWS SQS, que garante o funcionamento da aplicação mesmo em caso de queda do DW. O SQS (como você deve imaginar) também 
possui custo adicional.

## Principais benefícios de um Data Warehouse em Nuvem:

-Ambiente descentralizado

-Sem custo de infraestrutura

-TCO(custo total de propriedade) reduzido

-Escalabilidade para Petabytes de dados

-Segurança

-Acesso via internet de qualquer local

-Gestão Simplificada


## Principais desvantagens de um Data Warehouse em Nuvem:

-Falta de flexibilidade

-Dados sensíveis estão sob a gestão de terceiros(Amazon ou Microsoft etc...)

-Segurança(Repare que seguranças está na vantagem e desvantagem irei explicar em detalhes)

-Integração de dados.


No ambiente on premises você configura tudo você consegue montar um ambiente conforme a necessidade da empresa no ambiente em nuvem você não configura nada de infraestrutura você sequer tem acesso ao SO(sistema operacional) mas você precisa mudar o paradigma se você realmente precisa mudar alguma coisa do SO se você precisa mudar algum parâmetro do banco de dados o que já é oferecido em nuvem não é o suficiente? A empresa tem que responder isso a fim de tomar sua decisão de levar seu DW para nuvem.

Dados sensíveis alguma empresa listada em Bolsa de valores não pode devido a lei Sarbanes-Oxley (SOX) mas, existe alternativas você pode criptografar os dados você pode criar uma nuvem privada, ou seja, somente o escritório da empresa o IP daquele escritório pode acessar o ambiente em nuvem em forma de contornar esse problema .

A segurança aparece aqui como desvantagem porque quando você tem um ambiente em nuvem claro que invadir um ambiente é difícil porque o ambiente da Amazon é seguro, mas e se alguém descobri a senha? Ai não tem hacker que resolva se empresa tem um vazamento interno de senhas, mas o problema não é só de nuvem o físico também pode acontecer ... muitas empresas não tem o cuidado ou o padrão para esse tipo de coisa muitas vezes tem o post-it no monitor com a senha... 

Integração de dados se você vai montar o DW em nuvem depois como vou fazer para integrar esse meu DW com as aplicações analítica? Como vou carregar os dados? Como vou processar meu ETL? Tudo isso deve ser considerado mais uma vez precisa mudar o paradigma não da para você querer mudar para nuvem o mesmo processo que você tem on premises esse é um erro muito comum a empresa que reproduzir um ambiente em nuvem o que ela já faz internamente e localmente mas não é essa a abordagem o ambiente em nuvem é diferente não da para usar o mesmo tipo de processo lembrando que a Amazon já oferece um serviço de ETL e integração de dados...

![2](https://github.com/pand-eX/DwNuvem/blob/main/assets/2.png)

## Umas das tarefas mais desafiadora ao se trabalhar com AWS é a precificação vou sitar 3 razões principais que me leva a este desafio.

- Nós temos mais de 1000 serviços na AWS dificilmente você ira usar apenas um serviço é bem provável que você utiliza mais de um e por isso você precisa verificar o preço de cada um dos serviços que será usado individualmente 

- Cada serviço tem diferenças de Faixa de precificação no caso do Amazon Redshift por exemplo nós temos 3 faixa diferentes não apenas a questão de preço por serviço mas o preço de cada uma das faixas por serviço eu vou escolher cada uma dessas faixas quando estiver contratando o serviço 

- Cada região AWS tem um preço diferente para cada uma das faixas de preço em um serviço AWS, Sim, isso mesmo tem 3 razões que nós leva realmente a desafios na hora de você montar uma estrutura de preço a prevê realmente quando você vai gastar por mês ou por ano com o serviço AWS é o planejamento e a chave da questão quando você faz um planejamento de longo prazo você acaba pagando menos que aliás e umas das grandes vantagem em vários serviços AWS

E porque isso é importante ???

Quando você trabalha com ambiente na nuvem da Amazon com Aws você vai estar pagando por Hora ou paga antes mesmo de usar independentemente da forma de contratação é meu trabalho otimizar a utilização de recursos no caso de sob demanda por exemplo você tem lá 3, 4 horas se você consegue otimizar sua query otimizar suas consultas do Amazon Redshift você vai pagar menos por que vai usar menos tempos é importante conhecer o mínimo sobre o funcionamento do banco de dados amazona Redshift de modo a construir um DW que seja o mais performático possível. 
- Query Optimization(ele se carrega a descobrir qual o slices dentro de um único node ele deve buscar os dados como ele deve se conectar com os computer nodes para buscar os dados que você está consultando como ele deve buscar os blocos em cada computer nodes em cada slices para otimizar sua consulta e assim por diante ou seja nós temos pouco em se preocupar em relação a isso, temos algumas poucas configurações boa parte e feita pelo engines do amazon) 
- Internal statistic and heuristics(isso também tem no banco Oracle ele basicamente calcula as estatística nada mais é que um conjunto de informações para criar o plano de execução de uma query quando você dispara uma Query no banco de dados uma consulta o banco de dados o engine ele pesquisa na estatística para saber em qual tabela ele vai buscar os dados em quais segmentos e assim por diante com Amazon Redshift é a mesma coisa aliás é um comportamento quase padrão em quase todos os banco de dados Relacionais. Esse procedimento de calcular as estatísticas e as heurística para o plano de execução da Query
-ACID compliance (isso basicamente defini qualquer transação de banco de dados uma única transação ela deve ser atômica, ou seja, única consistente não posso parar a transação no meio ela deve ser isolada, ou seja, posso ter 2 transações rodando simultaneamente e Durabilidade, ou seja, uma vez que a transação tiver sido concluída ele tem que ser gravada no banco de dado)
- Até aqui nós temos as mesmas características que no banco de dados Relacional mas nós temos uma característica inerente que é particular ao Amazon Redshift que é >>
– Data Distribution(que é a forma pela qual o Amazon Redshift o Engine destribui os dados através de um cluster)

## Estilos de Distribuição

- Você tem vários blocos de dados distribuídos em vários nodes

![3](https://github.com/pand-eX/DwNuvem/blob/main/assets/3.png)

A definição do estilo quem vai definir sou eu de acordo com o Esquema de DW que eu for implementar nesse projeto iremos usar o esquema snow flake no Oracle usamos o modelo Star Squema. Cada esquema vai ter um estilo e um comportamento diferente na hora de retorna os dados 

![4](https://github.com/pand-eX/DwNuvem/blob/main/assets/4.png)

- Nós temos 3 estilos eles são:

![5](https://github.com/pand-eX/DwNuvem/blob/main/assets/5.png)

- Não é possível mudar o estilo de distribuição depois que a tabela foi criada você TEM QUE FAZER ANTES DE COLOCAR OS DADOS 


## Armazenamento Orientado a Coluna e a Velocidade do Redshift

![6](https://github.com/pand-eX/DwNuvem/blob/main/assets/6.png)

-linhas é o tradicional então precisamos mudar o paradigma o Amazon redshift usa o coluna!

![7](https://github.com/pand-eX/DwNuvem/blob/main/assets/7.png)

![8](https://github.com/pand-eX/DwNuvem/blob/main/assets/8.png)

Algumas Característica do banco redshift 

- CRUD( create, ready, update, delete) isso e de banco OLTP em um banco de dado OLTP não faz sentido usar um banco de dados orientado a coluna ai usamos SQLservice / Oracle ...

![9](https://github.com/pand-eX/DwNuvem/blob/main/assets/9.png)


## Compressão de dados

- Por ser um banco de dados orientada a coluna possuí outra vantagem a compressão de dados(cada coluna de uma tabela em blocos diferente ao contrário do armazenamento baseado em linhas aonde eu tenho cada linha em um bloco ou é claro posso ter várias linhas no mesmo bloco mas enfim uma linha inteira ela pertence pelo menos um bloco na no banco de dados relacionado a coluna eu tenho uma Coluna pertencendo a um bloco sendo assim quando você precisa operação de agregação, simurização em uma única coluna você pega aquela coluna e carrega na memória o engine do amazona redshift carrega apenas a coluna que você vai fazer a operação na memória isso com certeza acelera o tempo de consulta pq eu não preciso carregar colunas que não está sendo usada naquela consulta essa é a principal vantagem 

![10](https://github.com/pand-eX/DwNuvem/blob/main/assets/10.png)

-Se analisarmos apenas uma coluna ela são do mesmo tipo seja qual for flot, inteiro são valores numéricos, mas sempre do mesmo tipo de dados. Eu vou ter uma coluna inteira em um bloco que são dados do mesmo Tipo logo a compressão ela será muito mais eficiente Amazon Redshift vai conseguir comprimir esses dados reduzindo os espaços de armazenamento e que claro traz vantagem significativa que e também na hora de você fazer consulta.

![11](https://github.com/pand-eX/DwNuvem/blob/main/assets/11.png)


## Resultado final
![15](https://github.com/pand-eX/DwNuvem/blob/main/assets/15.png)

- isso aqui é o trabalho final o PowerBI acabou de executar uma query direto no Amazon Redshift na nuvem e pronto apartir de agora é trabalho do usuario final coletar os insights criar as visualizações e com isso tomar as decisões. É simples o processo o Amazon Redshift fornece  realmente um poder muito grande elimina boa parte daquele trabalho manual que você tem de preparar todo o ambiente Clouding Computer é claramente o futuro.
- No Amazon Redshift é possivel chegar algumas informações e mostrar a query e o tempo de resposta que o Powerbi levou para retornar os dados para o usuario final. Tem também o plano de execução e os graficos de performance. 

![16](https://github.com/pand-eX/DwNuvem/blob/main/assets/16.png)


