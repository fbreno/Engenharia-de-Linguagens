%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern void yyerror(const char *s);

%}

%union {
	int    iValue; 	/* integer value */
	float  fValue;  /* float value */
  char   *strval;
  char   *sValue;
};

%token INT CHAR LONG VOID FLOAT DOUBLE BOOLEAN 
%token FOR WHILE STRUCT STRUCT_ID
%token IF ELSE BREAK CONTINUE
%token PRINT PRINTF SCANF 
%token TRUE FALSE RETURN IMPORT SEMICOLON ASSIGN PLUS PLUSPLUS MINUS MINUSMINUS TIMES DIVIDE REST_OF_DIVISION
%token GT LT LE GE EQ NE LEFT_PARENTHESIS RIGHT_PARENTHESIS NUMBER ID
%token LOGIC_AND LOGIC_OR NOT
%token MAIN VALUE

%left PLUS MINUS
%left TIMES DIVIDE REST_OF_DIVISION
%nonassoc GT LT LE GE EQ NE
%right NOT
%left PLUSPLUS MINUSMINUS

%start program
%%

program: subps;

subps: 
     | subp subps
     ;

subp: funcao;

funcao : type_specifier ID LEFT_PARENTHESIS parameter_list RIGHT_PARENTHESIS '{' body_function '}' {printf("Reconheci regra da função 1 \n");}
       | type_specifier MAIN LEFT_PARENTHESIS parameter_list RIGHT_PARENTHESIS '{' body_function '}'
       ; 

type_specifier: INT
              | CHAR
              | LONG
              | VOID
              | FLOAT
              | DOUBLE
              | BOOLEAN
              | STRUCT 
              | STRUCT STRUCT_ID
                ;

parameter_list :  {printf("param lista vazia\n");}
               | parameter
               | parameter ',' parameter_list
               ;

parameter : type_specifier ID;

body_function : statements;

body_repetition_structure : statements_repetition_structure;

statements : 
           | statement SEMICOLON statements
           ;

statements_repetition_structure : 
                     | statement_repetition_structure SEMICOLON statements_repetition_structure
                     ;

statement : declaration_list 
          | for_statement
          | if_statement
          | while_statement
          | return_statement
          | struct_statement
          ;

statement_repetition_structure: declaration_list 
                              | for_statement
                              | if_statement
                              | while_statement
                              | return_statement
                              ;
        
declaration_list :
                 | declaration  declaration_list
                 ;

declaration : type_specifier ID 
            | type_specifier ID '[' NUMBER ']'
            ; 

assignment : ID ASSIGN VALUE
           | ID ASSIGN expression
           ;

for_statement : FOR LEFT_PARENTHESIS for_expression RIGHT_PARENTHESIS '{' body_repetition_structure'}' ;

while_statement : WHILE LEFT_PARENTHESIS expression RIGHT_PARENTHESIS '{' body_repetition_structure'}' ;

if_statement : IF LEFT_PARENTHESIS expression RIGHT_PARENTHESIS '{' body_function '}' 
             | IF LEFT_PARENTHESIS expression RIGHT_PARENTHESIS '{' body_function '}' else_statement
             ;

else_statement : ELSE '{' statements '}'   

struct_statement : STRUCT STRUCT_ID '{' declaration_list '}';

return_statement : RETURN expression
                 | RETURN 
                 ;

expression : expression PLUS expression
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
           | NOT expression
           ;


for_expression : SEMICOLON SEMICOLON
               | assignment SEMICOLON expression SEMICOLON expression
               | type_specifier assignment SEMICOLON expression SEMICOLON expression
               ;

%%
