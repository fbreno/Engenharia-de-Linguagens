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

program: statement_list;

statement_list: statement
                |statement statement_list;

statement:  declaration
            | statement declaration
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

primary_expression: ID
               | NUMBER
               | '(' expression ')'
               ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
