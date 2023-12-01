# Linguagem de programação educacional

Para executar no linux :
1. Abra a pasta do projeto no terminal
2. flex lex.l ou lex lex.l
3. gcc lex.yy.c -o lexico
4. ./lexico < entrada1.txt

Para testar o sintatico : 
1. flex lex.l ou lex lex.l
2. yacc -d -v -g parser.y
3. gcc -o parser y.tab.c lex.yy.c -lfl
4. ./parser

obs.: no passo 4 adicione o nome da entrada que preferir