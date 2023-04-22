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

# e) Quantidade total de memória principal em uso (todos os usuários)

# f) Capacidade total de memória swap

# g) Quantidade total de memória swap em uso

# h) Número total de processos do usuário corrente

# i) Quantidade total de memória ocupada pelos processos do usuário corrente.

# j) Quantidade de page-faults do sistema.

# Sessão de testes
echo "host: $host"