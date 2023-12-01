all: compilador

lexico : lex.yy.c 
	gcc lex.yy.c -o lexico

sintatico : lex.yy.c y.tab.c
	gcc -o parser y.tab.c lex.yy.c -lfl

compilador: lex.yy.c y.tab.c
	gcc lex.yy.c y.tab.* ./lib/record.c -o compiler 

lex.yy.c: lex.l
	flex lex.l

y.tab.c: parser.y
	yacc -d -v -g parser.y

clean: 
	rm -rf lex.yy.c y.tab.* compiler output.txt y.output y.gv parser.gv parser.h parser.output