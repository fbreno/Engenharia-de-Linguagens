#!/bin/bash

# Verifica se foi fornecido um parâmetro de entrada
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <parametro_de_entrada>"
    exit 1
fi

# Parâmetro de entrada fornecido
parametro=$1

# Caminho para o diretório lexico
lexico_dir="lexico"

# Caminho para o diretório sintatico
sintatico_dir="sintatico"

# Nome do arquivo de link
link_file="run_link"

# Verifica se o diretório lexico existe
if [ -d "$lexico_dir" ]; then
    echo "Executando lex no arquivo $lexico_dir/lex.l"
    lex $lexico_dir/lex.l
else
    echo "O diretório $lexico_dir não existe."
    exit 1
fi

# Verifica se o diretório sintatico existe
if [ -d "$sintatico_dir" ]; then
    echo "Executando yacc no arquivo $sintatico_dir/parser.y com os argumentos -d -v -g"
    yacc -d -v -g $sintatico_dir/parser.y

    # Compila os arquivos gerados por lex e yacc
    echo "Compilando os arquivos gerados por lex e yacc..."
    gcc lex.yy.c y.tab.c -o $link_file

    # Cria um arquivo de link na pasta raiz
    ln -s $sintatico_dir/$link_file ./$link_file

    # Executa o programa compilado com o parâmetro fornecido
    echo "Executando ./$link_file com o parâmetro: $parametro"
    ./$link_file "$parametro"
else
    echo "O diretório $sintatico_dir não existe."
    exit 1
fi
