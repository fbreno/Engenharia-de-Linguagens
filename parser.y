%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern void yyerror(const char *s);

int yywrap(void) {
    return 1;
}
%}

%token INT CHAR LONG VOID FLOAT DOUBLE BOOLEAN 
%token FOR WHILE STRUCT
%token IF ELSE BREAK CONTINUE
%token PRINT PRINTF SCANF 
%token TRUE FALSE RETURN IMPORT SEMICOLON ASSIGN PLUS PLUSPLUS MINUS MINUSMINUS TIMES DIVIDE REST_OF_DIVISION
%token GT LT LE GE EQ NE LEFT_PARENTHESIS RIGHT_PARENTHESIS NUMBER ID
%token LOGIC_AND LOGIC_OR NOT
%token MAIN

%%

program: subps;

subps: 
    | subp subps
    ;

subp: funcao;

funcao : type_specifier ID '(' parameter_list ')' '{' body_function '}'
       ; 

type_specifier: INT
              | CHAR
              | LONG
              | VOID
              | FLOAT
              | DOUBLE
              | STRUCT
              | BOOLEAN
                ;

parameter_list :  
               | parameter parameter_list
               ;

parameter : type_specifier ID;

body_function : 
              | return ';'
              | statement statements
              ;

statements : 
           | statement statements;

statement : 
          | declaration      
          | expression ';'
          | for_statement
          | if_statement
          | while_statement
          | return_statement
          ;

for_statement : FOR '(' for_expression ')' '{' statements '}'

if_statement : IF '(' expression ')' '{' statements '}'

while_statement : WHILE '(' expression ')' '{' statements '}'

return_statement : RETURN expression ';'


for_expression : FOR '(' ';' ';' ')'
               | FOR '(' type_specifier atrib ',' expression, '' ')' 
               |            

               1.for(int i = 0 ; exp ; expressio) ; 
               2.for( i = 0)
               
               type_specifier ATRIB, EXP, ATRIB
               ATRIB, EXP, ATRIB

 
    

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
