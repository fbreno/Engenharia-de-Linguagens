#!/bin/bash

# Verifica se foi fornecido um parâmetro de entrada
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <parametro_de_entrada>"
    exit 1
fi

# Parâmetro de entrada fornecido
parametro=$1

# Verifica se o diretório lexico existe
if [ -d "lexico" ]; then
    echo "Entrando no diretório lexico..."
    cd lexico

    # Verifica se lex.l existe
    if [ -f "lex.l" ]; then
        echo "Executando lex no arquivo lex.l"
        lex lex.l
    else
        echo "O arquivo lex.l não foi encontrado."
        exit 1
    fi

    # Retorna ao diretório anterior
    cd ..

    # Verifica se o diretório sintatico existe
    if [ -d "sintatico" ]; then
        echo "Entrando no diretório sintatico..."
        cd sintatico

        # Verifica se parser.y existe
        if [ -f "parser.y" ]; then
            echo "Executando yacc no arquivo parser.y com os argumentos -d -v -g"
            yacc -d -v -g parser.y

            # Compila os arquivos gerados por lex e yacc
            echo "Compilando os arquivos gerados por lex e yacc..."
            gcc lex.yy.c y.tab.c -o run.o

            # Executa o programa compilado com o parâmetro fornecido
            echo "Executando ./run.o com o parâmetro: $parametro"
            ./run.o "$parametro"
        else
            echo "O arquivo parser.y não foi encontrado."
            exit 1
        fi

        # Retorna ao diretório anterior
        cd ..
    else
        echo "O diretório sintatico não existe."
        exit 1
    fi

else
    echo "O diretório lexico não existe."
    exit 1
fi
