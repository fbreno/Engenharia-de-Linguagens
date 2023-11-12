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

# Nome do arquivo de saída
output_file="run_output"

# Copia lex.l e parser.y para a pasta raiz, se ainda não estiverem presentes
cp -n $lexico_dir/lex.l .
cp -n $sintatico_dir/parser.y .

# Executa lex no arquivo lex.l
echo "Executando lex no arquivo lex.l"
lex lex.l

# Executa yacc no arquivo parser.y com os argumentos -d -v -g
echo "Executando yacc no arquivo parser.y com os argumentos -d -v -g"
yacc -d -v -g parser.y

# Compila os arquivos gerados por lex e yacc
echo "Compilando os arquivos gerados por lex e yacc..."
gcc lex.yy.c y.tab.c -o $output_file

# Executa o programa compilado com o parâmetro fornecido
echo "Executando ./$output_file com o parâmetro: $parametro"
./$output_file "$parametro"

# Exclui as cópias dos arquivos
echo "Excluindo as cópias dos arquivos..."
rm lex.l parser.y
