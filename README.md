# AP2Q3_SO
Shell script para gerência de memória.

Atividade individual ou em dupla, caso seja dupla identificar as pessoas como comentário dentro do shell script.

IMPORTANTE: como essa questão tem prazo de cinco dias  não haverá segunda chamada.

3. Elabore um programa em shell script (<primeironome1>_<primeironome2>_memoria.sh) no qual o programa grava um arquivo txt com as seguintes informações (nesta sequência), separadas por vírgula em uma linha (CSV):

- Data (YYYYMMDD)

- Usuário corrente

- Nome do host

- Capacidade total da memória principal disponível/instalada no computador

- Quantidade total de memória principal em uso (todos os usuários)

- Capacidade total de memória swap

- Quantidade total de memória swap em uso

- Número total de processos do usuário corrente

- Quantidade total de memória ocupada pelos processos do usuário corrente.

- Quantidade de page-faults do sistema.

Obs.1: O arquivo deve ter o nome no seguinte formato: <<primeironome1>_<primeironome2>_YYYYMMDD>_memoria_<usuário corrente>.csv

Obs.2: Fazer um loop para executar memoria.sh a cada 20s em um intervalo de 5min.

Obs.3: Enviar junto com o shell script o arquivo <<primeironome1>_<primeironome2>_YYYYMMDD>_memoria_<usuário corrente>.csv obtido (Obs. 2).

Obs.4: Caso o programa seja executado no mesmo dia mais de uma vez no mesmo diretório, então não deve ser criado um arquivo novo e sim adicionada uma nova linha com as informações a cada nova execução. Incluir no topo uma linha de cabeçalho com as informações quando o arquivo for criado.


Submeter .sh e uma saída com .csv da execução do shell script.

Atividade em dupla, submeter apenas uma pessoa. Colocar os nomes  completos como comentário no shell script.

Atenção códigos copiados ou com alto grau de similaridade com outros trabalhos submetidos serão considerados plágio e receberão nota Zero em toda AP2.

# Instrucoes para execução

Para executar o programa, no terminal digite: sh Karina_ProcessosSistema.sh e o resultado sera exibido no terminal.

Tarefas: 
[x] - Criar repositorio no github para o trabalho 
[x] - Fazer clone do repositorio 
[x] - Criar um SH com o nome Karina_memoria.sh 
[x] - Receber como argumento o nome do usuário. 
[x] - Verificar se o usuario recebido como argumento existe 
[x] - Obter o usuario corrente. 
[x] - Utilizar o usuario corrente caso não seja informado um usuario por argumento ou o usuario do argumento nao existir 
[] - Criar arquivo 
[x] - Criar arquivo com padrão de nome <<primeironome1>_<primeironome2>_<YYYYMMDD>_memoria_<usuário corrente>.csv 
[x] - Ao criar o arquivo, escrever o cabeçalho de acordo com a obs 3 
[] - Verificar se um arquivo com um determinado nome ja existe 
[] - Caso o arquivo exista, escrever no final adicionando uma linha 
[] - Escrever no arquivo com o formato da Obs. 1. 
[x] - Obter o nome do host.
[] - Capacidade total da memória principal disponível/instalada no computador. 
[] - Quantidade total de memória principal em uso (todos os usuários).
[] - Capacidade total de memória swap.
[] - Quantidade total de memória swap em uso.
[] - Número total de processos do usuário corrente.
[] - Quantidade total de memória ocupada pelos processos do usuário corrente.
[] - Quantidade de page-faults do sistema.
[] - Fazer um loop para executar memoria.sh a cada 20 s em um intervalo de 5 min.