# Implementando um Data Warehouse na Nuvem com Amazon Redshift AWS!!

[![NPM](https://img.shields.io/npm/l/react)](https://github.com/pand-eX/DwNuvem/blob/main/LICENSE) 

# About the project

-Seria possível montar um Data Warehouse para armazenamento e processamento de petabytes de dados em apenas alguns cliques? 

A: Sim! Com amazon Redshift.

- Você viu o trabalho que era montar um Data Warehouse no local com a Oracle. E olha que montamos um ambiente controlado um ambiente pequeno um ambiente na minha Máquina Virtual.

-Agora vamos para o ambiente de nuvem com alguns cliques teremos um Data Warehouse operacional com cluster com segurança e pronto para processar tetabytes de dados e um custo na maioria dos casos muito menor em comparação com Data Warehouse on-premise ou seja, não ignorar que a computação em nuvem é a evolução da área de Tecnologia.



## Why?

porque sabemos que a Cloud Computing é o futuro da TI. 

- Este projeto faz parte do meu portfólio pessoal, então ficarei feliz se você puder me dar algum feedback sobre o projeto, código, estrutura ou qualquer coisa que você possa relatar que possa me fazer um melhor engenheiro de dados!

Email-me: henricao_7@yahoo.com.br

Connect with me at [LinkedIn](https://www.linkedin.com/in/henrique-castro-484269203//).

## Quero deixar 3 guias gratuitos no Kindle no Amazon Redshift AWS e também um link com a documentação de linguagem SQL usada no Amazon Redshift !!!

https://docs.aws.amazon.com/pt_br/redshift/latest/dg/cm_chap_SQLCommandRef.html

![1](https://github.com/pand-eX/DwNuvem/blob/main/assets/1.png)


## Atenção!!!

-Vamos trabalhar com a operação de data warehouse, vamos criar um Squema, carregar alguns dados e vamos executar alguma consulta é importante que você considere que a mudança de paradigma é um procedimento muito diferente não temos mais que nos preocupar com arquivos de configuração, infraestrutura com sistema operacional com instalação de software Eu simplesmente clique em uma página web permitir que o Data Warehouse defina algumas regras e conectar,  Eu carrego meus dados e começo a operação de consulta!!! Vamos!

## Iniciando o projeto

Neste segundo projeto de implantação de data warehouse, trabalharemos com o ambiente de nuvem da Amazon e o serviço amazon redshift. Vamos implementar um cluster com 3 nós, um líder e dois nós computacionais. Nosso cluster terá apenas um banco de dados. Criaremos as tabelas FACT e DIMENSION e carregaremos apenas algumas tabelas.
Os scripts usados no projeto são anexados e em ordem!!!

## Conceito Básico!

![12](https://github.com/pand-eX/DwNuvem/blob/main/assets/12.png)

Um aglomerado Amazon Redshift consiste em nós. Cada cluster tem um nó principal e um ou mais nós computacionais. O nó lead recebe consultas de aplicativos do cliente, analisa consultas e desenvolve planos de execução de consultas. O nó principal então coordena a execução paralela desses planos com os nódulos computacionais e agrega os resultados intermediários desses nódulos. Em seguida, devolve os resultados para as aplicações do cliente. Os nódulos computacionais executam planos de execução de consulta e 
transmitir dados uns aos outros para atender a essas consultas. Os resultados intermediários são enviados ao nó de chumbo para agregação antes de serem enviados de volta às aplicações do cliente. Quando você executa um cluster, uma opção especificada é o tipo de nó. O tipo de nó determina o tipo de CPU, RAM, capacidade de armazenamento e unidade de armazenamento de cada nó. Os nós de armazenamento denso (DS) são otimizados para armazenamento. Os nós desnsos da computação (DC) são otimizados para computação. Você pode criar um cluster usando tipos de nó denso de armazenamento (DS) ou denso de computação (DC). Os tipos de nó de armazenamento densos permitem criar armazéns de dados muito grandes usando discos rígidos (HDDs) por um preço muito baixo. Os tipos de nó de computação denso permitem criar data warehouses de alto desempenho usando CPUs rápidas, grandes quantidades de RAM e discos de estado sólido (SSDs). Os nós do tipo DS2 são otimizados para grandes cargas de trabalho de dados e usam armazenamento baseado em disco rígido (HDD). Os nós DC1 e DC2 são otimizados para cargas de trabalho intensivas em desempenho. Como eles usam armazenamento em disco de estado sólido (SSD), os tipos de nó DC1 e DC2 fornecem I/O muito mais rápido em comparação com os nódulos do tipo DS, mas fornecem menos espaço de armazenamento. Você executa clusters que usam
os tipos de nó DC2 em uma nuvem virtual privada (VPC). Você não pode executar clusters DC2 no modo EC2 clássico. O tipo de nó que você escolher depende muito de três informações:

• A quantidade de dados que você importa para o Amazon Redshift
• A complexidade das consultas e operações que você realiza no 
dados
• As necessidades de sistemas a jusante que dependem dos resultados 
dessas consultas e operações

Os tipos de nó estão disponíveis em diferentes tamanhos. Os nós DS2 estão disponíveis nos tamanhos xlarge e 8xlarge. Os nós DC2 estão disponíveis em tamanhos grandes e 8xlarge. O tamanho do nó e o número de nós determinam o armazenamento total de um cluster. Alguns tipos de nó permitem um nó (nó único) ou dois ou mais nodes (multi-node). A quantidade mínima para clusters de 8xlarge é de dois nós. Em um cluster de um único nó, o nó é compartilhado para funcionalidade primária e computacional. Em um cluster de vários nós, o nó de chumbo é separado dos nós computacionais. Amazon Redshift aplica cotas a recursos para cada conta AWS em cada região. Uma cota restringe o número de recursos que sua conta pode criar para certos tipos de recursos, como nós ou Snapshots, em uma região.

## Banco de dados no Amazon Redshift Cluster

O Amazon Redshift cria um banco de dados quando você disponibiliza um cluster. Este é o banco de dados que você usa para carregar dados e executar consultas em seus dados. Você pode criar bancos de dados adicionais executando um comando SQL conforme necessário. O limite é de até 60 bancos de dados por cluster. Ao fornecer um cluster, você especifica um usuário primário que tem acesso a todos os bancos de dados criados no cluster. Este usuário principal é um superusuário que é inicialmente o único usuário com acesso ao banco de dados, embora esse usuário possa criar outros superusuários e usuários. O Amazon Redshift usa grupos de parâmetros para definir o comportamento de todos os bancos de dados em um cluster, como estilo de apresentação de data e precisão de ponto flutuante. Se você não especificar um grupo de parâmetros ao provisionar seu cluster, o Amazon Redshift vincula um grupo de parâmetros padrão ao cluster.

## Arquitetura do Data Warehouse com Amazon Redshift 

A criação de um Data Warehouse requer duas etapas principais de trabalho:
1- Modelagem
2- Infraestrutura

No que diz respeito à modelagem, os procedimentos são os mesmos, independentemente da implementação no local ou na nuvem. Todas as etapas como definição de problemas de negócios, business case, especificação, modelagem lógica, dimensional e física seguem os mesmos padrões uma vez que estamos lidando com o design da DW. No que diz respeito à infraestrutura, as diferenças entre a implementação on-premise e a cloud são grandes, pois são diferentes "mundos" com diferentes abordagens e custos. A escolha de uma ou outra opção depende de vários fatores e uma escolha profissional requer uma avaliação de 360 graus. Em uma implementação de DW em nuvem, a arquitetura envolve fatores além do serviço de nuvem que está sendo usado (Amazon Redshift no nosso caso), porque precisamos definir níveis de acesso e segurança, armazenamento, backup, integração, ETL, custos de transferência de dados, largura de banda para acesso a serviços em nuvem, etc... Tudo isso deve ser levado em conta para que o custo de uma implantação em nuvem justifique seu uso. Embora existam outras opções, podemos falar especificamente sobre a AWS, já que estamos usando esse serviço aqui em nosso projeto. Além do Amazon Redshift, uma implementação de DW em nuvem (normalmente) requer o uso de outros serviços AWS, tais como:

• S3 (Serviço de Armazenamento Simples)

• VPC (Virtual Private Cloud)

• EIP (IP Elástico)

• Relógio em nuvem

• IAM (Gerenciamento de Identidade e Acesso)

Desses 5 serviços, apenas o IAM não tem custo. Embora você possa usar um VPC padrão, qualquer personalização pode insautilizar encargos adicionais. O armazenamento com S3 (para colocar arquivos que serão carregados para DW), EIP (para ter um IP exclusivo) e Cloud Watch (para monitoramento e alarmes) não são necessários em uma implementação amazon redshift, mas podem ajudar a colaborar para tornar a experiência em nuvem muito mais profissional. A arquitetura DW no AWS também pode ser dividida em duas etapas. Primeiro a arquitetura Amazon Redshift Cluster (como mostrado abaixo). O número de nós computacionais determina o custo do cluster e deve ser avaliado cuidadosamente.


![13](https://github.com/pand-eX/DwNuvem/blob/main/assets/13.png)

Em segundo lugar, a arquitetura de acesso a clusters do Amazon Redshift, para que os usuários tenham acesso ao DW, como mostrado abaixo:

![14](https://github.com/pand-eX/DwNuvem/blob/main/assets/14.png)

Neste momento, outros serviços da AWS devem ser considerados. O VPN Gateway permite que você crie uma conexão segura entre o escritório da empresa e seu ambiente AWS, mas também é um serviço AWS econômico para o Redshift. É trabalho do engenheiro de dados pensar na melhor arquitetura para o projeto, visando reduzir custos e otimizar a utilização de recursos. Embora seja possível usar o Redshift apenas por um período de tempo e pagar por horas não utilizados, nem todos os serviços seguem esse mesmo padrão (não faz sentido escrever e excluir dados no S3, por exemplo, usando idealmente seus recursos de versionação). Arquiteturas mais avançadas podem exigir o uso de serviços de mensageiro, como o AWS SQS, que garante a operação do aplicativo mesmo em caso de queda do DW. SQS (como você pode imaginar) também 
tem um custo adicional.

## Principais benefícios de um Data Warehouse na nuvem:

-Ambiente descentralizado

-Sem custo de infraestrutura

-TCO (custo total de propriedade) reduzido

-Escalabilidade para Petabytes de dados

- Segurança

-Acesso à Internet de qualquer local

-Gestão Simplificada


## Principais desvantagens de um Data Warehouse na nuvem:

-Falta de flexibilidade

-Dados confidenciais estão sob a gestão de terceiros (Amazon ou Microsoft etc...)

-Segurança (Note que a segurança está em vantagem e desvantagem eu explicarei em detalhes)

- Integração de dados.


No ambiente no local você configura tudo o que você pode configurar um ambiente conforme necessário pela empresa no ambiente de nuvem você não configura nada de infraestrutura você ainda tem acesso ao SO (sistema operacional), mas você precisa mudar o paradigma se você realmente precisa mudar algo do SO se você precisar alterar algum parâmetro do banco de dados o que já é oferecido na nuvem não é suficiente? A empresa tem que responder a isso para tomar sua decisão de levar seu DW para a nuvem.

Dados confidenciais que algumas empresas listadas na Bolsa de Valores não podem devido à lei sarbanes-oxley (SOX), mas, existem alternativas que você pode criptografar os dados que você pode criar uma nuvem privada, ou seja, apenas o escritório da empresa o IP desse escritório pode acessar o ambiente de nuvem a fim de contornar esse problema .

A segurança aparece aqui como uma desvantagem porque quando você tem um ambiente de nuvem claro que invadir um ambiente é difícil porque o ambiente da Amazon é seguro, mas e se alguém descobriu a senha? Ai não tem hacker que resolva se empresa tem um vazamento interno de senhas, mas o problema não é só nuvem o físico também pode acontecer ... muitas empresas não têm o cuidado ou o padrão para esse tipo de coisa muitas vezes têm o post-it no monitor com a senha... 

Integração de dados se você vai montar DW na nuvem mais tarde como eu integro este meu DW com os aplicativos de análise? Como vou carregar os dados? Como vou processar meu ETL? Tudo isso deve ser considerado mais uma vez precisa mudar o paradigma para não você querer mudar para nuvem o mesmo processo que você tem no local este é um erro muito comum da empresa que reproduz um ambiente de nuvem o que já faz interna e localmente, mas essa não é a abordagem que o ambiente em nuvem é diferente de usar o mesmo tipo de processo lembrando que a Amazon já oferece um serviço de ETL e integração de dados...

![2](https://github.com/pand-eX/DwNuvem/blob/main/assets/2.png)

## Uma das tarefas mais desafiadoras ao trabalhar com a AWS é o preço que eu vou sentar 3 principais razões que me levam a este desafio.

- Temos mais de 1000 serviços na AWS dificilmente você vai usar apenas um serviço é muito provável que você use mais de um e por isso você precisa verificar o preço de cada um dos serviços que serão usados individualmente 

- Cada serviço tem diferenças de faixa de preços no caso do Amazon Redshift, por exemplo, temos 3 faixas diferentes não só a questão do preço por serviço, mas o preço de cada uma das faixas por serviço eu escolherei cada uma dessas faixas ao contratar o serviço 

- Cada região da AWS tem um preço diferente para cada uma das faixas de preço em um serviço AWS, sim, são 3 razões que realmente levamos para desafios quando você monta uma estrutura de preços para realmente prever quando você vai gastar por mês ou um ano com o serviço AWS é o planejamento e a chave para a questão quando você faz um planejamento de longo prazo você acaba pagando menos que incidentalmente e um dos grandes vantagem em vários serviços AWS

E porque isso é importante ???

Quando você trabalha com o ambiente de nuvem da Amazon com Aws você estará pagando por Hora ou pago antes mesmo de usar, independentemente da maneira de contratar é meu trabalho para otimizar a utilização de recursos em caso de demanda por exemplo, você tem lá 3, 4 horas se você puder otimizar sua consulta otimizar suas consultas Amazon Redshift você vai pagar menos porque você vai usar menos vezes é importante saber o mínimo em o funcionamento do banco de dados Amazon Redshift, a fim de construir um DW que seja o mais performático possível. 
- Otimização de consulta (ele se carrega para descobrir quais fatias dentro de um único nó deve buscar os dados, pois deve se conectar com os nós do computador para buscar os dados que você está consultando, pois deve buscar os blocos em cada nós de computador em cada fatias para otimizar sua consulta e assim por diante, temos pouco a se preocupar com isso,  temos algumas configurações boa parte e feitas por motores amazon) 
- Estatística interna e heurística (isso também tem no Banco Oracle ele basicamente calcula que as estatísticas não são nada mais do que um conjunto de informações para criar o plano de execução de uma consulta quando você filma uma Consulta no banco de dados uma consulta ao banco de dados o mecanismo que pesquisa a estatística para saber em que tabela ele vai buscar os dados em que segmentos e assim por diante com Amazon Redshift é a mesma coisa aliás é um comportamento quase padrão em quase todas as bases de dados relacionais. Este procedimento de cálculo de estatísticas e heurísticas para o plano de execução de Consulta
-Conformidade ACID (isso basicamente definiu qualquer transação de banco de dados uma única transação deve ser atômica, ou seja, apenas consistente eu não posso parar a transação no meio que deve ser isolada, ou seja, eu posso ter 2 transações funcionando simultaneamente e Durabilidade, ou seja, uma vez que a transação tenha sido concluída ela tem que ser escrita para o banco de dados)
- Até agora temos as mesmas características do banco de dados relacional, mas temos uma característica inerente que é particularmente para o Amazon Redshift, que é >>
– Distribuição de dados (que é como o Amazon Redshift the Engine distribui os dados através de um cluster)

## Estilos de Distribuição

- Você tem vários blocos de dados distribuídos em vários nódulos

![3](https://github.com/pand-eX/DwNuvem/blob/main/assets/3.png)

A definição do estilo que vai definir sou eu de acordo com o DW Scheme que estou implementando neste projeto vamos usar o esquema de flocos de neve na Oracle usamos o Model Star Squema. Cada esquema terá um estilo e comportamento diferentes ao retornar os dados

![4](https://github.com/pand-eX/DwNuvem/blob/main/assets/4.png)

- Temos 3 estilos que são:

![5](https://github.com/pand-eX/DwNuvem/blob/main/assets/5.png)

- Não é possível alterar o estilo de distribuição depois que a tabela foi criada que você tem que fazer antes de colocar os dados 


## Armazenamento orientado para colunas e velocidade de desvio vermelho

![6](https://github.com/pand-eX/DwNuvem/blob/main/assets/6.png)

-linhas são tradicionais, então precisamos mudar o paradigma Que a Amazon redshift usa a coluna!

![7](https://github.com/pand-eX/DwNuvem/blob/main/assets/7.png)

![8](https://github.com/pand-eX/DwNuvem/blob/main/assets/8.png)

Algum recurso do Banco Redshift 

- CRUD (criar, pronto, atualizar, excluir) este e o banco OLTP em um banco de dados oltp não faz sentido usar um banco de dados orientado para colunas ai usamos SQLservice / Oracle ...

![9](https://github.com/pand-eX/DwNuvem/blob/main/assets/9.png)

## Compressão de dados

- Por ser um banco de dados orientado para colunas, tenho outra vantagem para a compressão de dados (cada coluna de uma tabela de bloco diferente ao contrário do armazenamento baseado em linha onde tenho cada linha em um bloco ou, claro, posso ter várias linhas no mesmo bloco, mas no final das contas uma linha inteira pertence a pelo menos um bloco no banco de dados relacionado à coluna eu tenho uma coluna pertencente a um bloco sendo assim quando você precisa de operação de agregação,  simurização em uma única coluna você pega essa coluna e carrega na memória o motor amazon redshift carrega apenas a coluna que você vai fazer a operação na memória isso com certeza acelera o tempo de consulta pq Eu não preciso carregar colunas que não estão sendo usadas nessa consulta esta é a principal vantagem

![10](https://github.com/pand-eX/DwNuvem/blob/main/assets/10.png)

-Se analisarmos apenas uma coluna é do mesmo tipo qualquer que seja o flot, inteiro são valores numéricos, mas sempre do mesmo tipo de dados. Terei uma coluna inteira em um bloco que são dados do mesmo tipo para que a compressão será muito mais eficiente Amazon Redshift vai conseguir comprimir esses dados reduzindo espaços de armazenamento e que, claro, traz vantagem significativa que e também quando você consulta.

![11](https://github.com/pand-eX/DwNuvem/blob/main/assets/11.png)


## Resultado final

![15](https://github.com/pand-eX/DwNuvem/blob/main/assets/15.png)

- este aqui é o trabalho final powerBI acabou de executar uma consulta direta sobre Amazon Redshift na nuvem e pronto a partir de agora é o trabalho do usuário final para coletar os insights criar as visualizações e com isso tomar as decisões. É simples o processo que o Amazon Redshift realmente fornece uma energia muito grande elimina grande parte desse trabalho manual que você tem para preparar todo o ambiente de Computador de Nuvem é claramente o futuro.
- No Amazon Redshift é possível obter algumas informações e mostrar o tempo de consulta e resposta que o Powerbi levou para devolver os dados ao usuário final. Também tem o plano de execução e os bônus de desempenho.



