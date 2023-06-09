#!/bin/bash

# Aluna: Karina Bressan Felicetti

coletaDadosMemoria() {
# $USER obtém o usuario atual
usuario=$USER

# Variável para guardar a informação da data atual (item a)
hoje=$(date +"%Y%m%d")

# Variável para criar o nome do arquivo com padrão de nome <<primeironome1>_<primeironome2>_<YYYYMMDD>_memoria_<usuário corrente>.csv 
nomeArquivo="Karina_"$hoje"_memoria_"$usuario".csv"

# Cabeçalho
cabecalho="Data (YYYYMMDD),Usuário corrente,Nome do host,Capacidade total da memória principal disponível/instalada no computador,Quantidade total de memória principal em uso (todos os usuários),Capacidade total de memória swap,Quantidade total de memória swap em uso,Número total de processos do usuário corrente,Quantidade total de memória ocupada pelos processos do usuário corrente,Quantidade de page-faults do sistema"

# a) Data (YYYYMMDD)
# $hoje

# b) Usuário corrente
# $usuario

# c) Nome do host
host=$(hostname)

# d) Capacidade total da memória principal disponível/instalada no computador
capacidadeMemoriaInstalada=$(free -k | awk 'NR==2{print $2}')

# e) Quantidade total de memória principal em uso (todos os usuários)
memoriaEmUso=$(free -k | awk 'NR==2{print $3}')

# f) Capacidade total de memória swap
swapTotal=$(free -k | awk 'NR==3{print $2}')

# g) Quantidade total de memória swap em uso
swapEmUso=$(free -k | awk 'NR==3{print $3}')

# h) Número total de processos do usuário corrente
processosAtivosUser=$(ps -f -u $usuario | wc -l)

# i) Quantidade total de memória ocupada pelos processos do usuário corrente.
memoriaProcessosUsuario="`ps aux | grep ^$usuario | awk 'BEGIN{total=0}; \
    {total += $4};END{print total}'`"

# j) Quantidade de page-faults do sistema.

# page faults por PID = $(ps -eo min_flt,maj_flt 1)
# major faults:
majorFaults=$(ps -eo maj_flt | awk 'BEGIN{total=0}; {total += $1};END{print total}')
# minor faults:
minorFaults=$(ps -eo min_flt | awk 'BEGIN{total=0}; {total += $1};END{print total}')
pageFaults=$(($majorFaults+$minorFaults))


# Criando o arquivo .csv com as respectivas variáveis de cada item
informacoes=$hoje","$usuario","$host","$capacidadeMemoriaInstalada","$memoriaEmUso","$swapTotal","$swapEmUso","$processosAtivosUser","$memoriaProcessosUsuario","$pageFaults

# Se o arquivo para o usuário e data já existe...
if test -e $nomeArquivo; then
# ...adiciona nova linha
    echo $informacoes >> $nomeArquivo
# Se o arquivo não existe, será criado com as informações da primeira execução:    
else
    # Criando o arquivo 
    echo "$cabecalho">$nomeArquivo
    echo $informacoes >> $nomeArquivo
fi

}
# Executando o programa por 5 min esperando 20 s a cada execução, resultando num total de 15 execuções.
runs=0;
while [ $runs -lt 15 ]:
do
    coletaDadosMemoria
    sleep 20
    runs=$(($runs+1))
done
