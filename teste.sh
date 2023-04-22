#!/bin/bash

# Aluna: Karina Bressan Felicetti

usuarioArgumento=$1
# $USER obtém o usuario atual
usuarioAtual=$USER

# Se o usuário do argumento existe, será utilizado (item b).
if id -u "$usuarioArgumento" > /dev/null 2>&1; then
        usuario=$usuarioArgumento
# Se o usuário do argumento não existir ou não for informado, será utilizado o usuário atual.
else
        usuario=$usuarioAtual
fi

# Variável para guardar a informação da data atual (item a)
hoje=$(date +"%Y%m%d")
# Variável para criar o nome do arquivo com padrão de nome <<primeironome1>_<primeironome2>_<YYYYMMDD>_memoria_<usuário corrente>.csv 
nomeArquivo="Karina_"$hoje"_memoria_"$usuario".csv"
# Cabeçalho
cabecalho="Data (YYYYMMDD),Usuário corrente,Nome do host,Capacidade total da memória principal disponível/instalada no computador,Quantidade total de memória principal em uso (todos os usuários),Capacidade total de memória swap,Quantidade total de memória swap em uso,Número total de processos do usuário corrente,Quantidade total de memória ocupada pelos processos do usuário corrente,Quantidade de page-faults do sistema"

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
memoriaProcessosUsuario="`ps aux | egrep ^$usario | awk 'BEGIN{total=0}; \
    {total += $4};END{print total}'`"

# j) Quantidade de page-faults do sistema.
# /usr/bin/time /bin/true --> não consegui pegar somente a info do sistema.
# $ perf stat make --> não consegui instalar o package perf

# page faults por PID = $(ps -o min_flt,maj_flt 1)
# major faults:
majorFaults=$(ps -o min_flt,maj_flt 1 | awk 'NR==2{print $1}')
# minor faults:
minorFaults=$(ps -o min_flt,maj_flt 1 | awk 'NR==2{print $2}')
pageFaults=$(($majorFaults+$minorFaults))

# /3 /5 * * * * sh teste.sh

# Sessão de testes

echo "page faults: $pageFaults"
echo "$a"