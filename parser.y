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
%token MAIN VALUE

%%

program: subps;

subps: 
    | subp
    | subp subps
    ;

subp: funcao;

funcao : type_specifier ID '(' parameter_list ')' '{' body_function '}'
       | type_specifier MAIN '(' parameter_list ')' '{' body_function '}'
       ; 

type_specifier: INT
              | CHAR
              | LONG
              | VOID
              | FLOAT
              | DOUBLE
              | BOOLEAN
              | STRUCT /* Adicionado STRUCT */
                ;

parameter_list :  
               | parameter
               | parameter ',' parameter_list
               ;

parameter : type_specifier ID;

body_function : 
              | statement
              | statement statements
              ;

statements : 
           | statement statements
           ;

statement : 
          | declaration      
          | expression SEMICOLON
          | for_statement
          | if_statement
          | while_statement
          | return_statement
          ;
        
declarations : 
             | declaration
             | declaration declarations
             ;

declaration : 
            | type_specifier ID SEMICOLON
            | type_specifier ID '[' NUMBER ']' SEMICOLON
            ; 

assignment : ID ASSIGN VALUE
            ;

for_statement : FOR '(' for_expression ')' '{' statements '}' ;

while_statement : WHILE '(' expression ')' '{' statements '}' ;

if_statement : IF '(' expression ')' '{' statements '}' 
             | IF '(' expression ')' '{' statements '} else_statement
             ;

else_statement : ELSE '{' statements '}'   

struct_statement : STRUCT ID '{' declarations '}' SEMICOLON ;

return_statement : RETURN expression SEMICOLON
                 | RETURN SEMICOLON
                 ;

expression : 
           | ID ASSIGN expression
           | expression PLUS expression
           | expression MINUS expression
           | expression TIMES expression
           | expression DIVIDE expression
           | expression REST_OF_DIVISION expression
           | expression GT expression
           | expression LT expression
           | expression LE expression
           | expression GE expression
           | expression EQ expression
           | expression NE expression
           | MINUSMINUS VALUE
           | PLUSPLUS VALUE
           | LEFT_PARENTHESIS expression RIGHT_PARENTHESIS
           | NOT expression
           ;


for_expression : /* Empty for an empty expression */
               | assignment SEMICOLON expression SEMICOLON expression
               | type_specifier assignment SEMICOLON expression SEMICOLON expression
               ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
