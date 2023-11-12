%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern void yyerror(const char *s);

int yywrap(void) {
    return 1;
}
%}

%token INT CHAR SHORT LONG VOID FLOAT DOUBLE FOR STRUCT PRINT PRINTF SCANF WHILE IF ELSE ELSE BREAK CONTINUE
%token TRUE FALSE RETURN IMPORT SEMICOLON COLON ASSIGN PLUS PLUSPLUS MINUS MINUSMINUS TIMES DIVIDE REST_OF_DIVISION
%token GT LT LE GE EQ NE LEFT_PARENTHESIS RIGHT_PARENTHESIS 
%token LEFT_BRACKET RIGHT_BRACKET LEFT_BRACE RIGHT_BRACE LOGIC_AND LOGIC_OR NOT


%%

program: statement
        ;

statement:  declaration
            | statement declaration
            ;

declaration: type_specifier ID SEMICOLON
           | type_specifier ID '(' parameter_list_opt ')' compound_statement
           ;

parameter_list_opt: /* empty */
                 | parameter_list
                 ;

parameter_list: parameter_declaration
              | parameter_list ',' parameter_declaration
              ;

parameter_declaration: type_specifier ID
                   ;

compound_statement: '{' statement_list '}'
                 ;

statement_list: /* empty */
              | statement_list statement
              ;

statement: expression_statement
         | compound_statement
         | selection_statement
         | iteration_statement
         | jump_statement
         | COMMENT
         ;

expression_statement: ';'
                  | expression ';'
                  ;

selection_statement: IF '(' expression ')' statement %prec IFX
                  | IF '(' expression ')' statement ELSE statement
                  ;

iteration_statement: WHILE '(' expression ')' statement
                 | FOR '(' expression_statement_opt expression_opt ';' expression_opt ')' statement
                 ;

expression_statement_opt: /* empty */
                     | expression_statement
                     ;

expression_opt: /* empty */
             | expression
             ;

jump_statement: BREAK SEMICOLON
             | CONTINUE SEMICOLON
             | RETURN expression_opt SEMICOLON
             ;

expression: assignment_expression
         | expression ',' assignment_expression
         ;

assignment_expression: conditional_expression
                  | unary_expression assignment_operator assignment_expression
                  ;

assignment_operator: ASSIGN
                 | TIMES_ASSIGN
                 | DIVIDE_ASSIGN
                 | PLUS_ASSIGN
                 | MINUS_ASSIGN
                 ;

conditional_expression: logical_or_expression
                  | logical_or_expression '?' expression ':' conditional_expression
                  ;

logical_or_expression: logical_and_expression
                  | logical_or_expression LOGIC_OR logical_and_expression
                  ;

logical_and_expression: equality_expression
                   | logical_and_expression LOGIC_AND equality_expression
                   ;

equality_expression: relational_expression
               | equality_expression EQ relational_expression
               | equality_expression NE relational_expression
               ;

relational_expression: additive_expression
                 | relational_expression LT additive_expression
                 | relational_expression GT additive_expression
                 | relational_expression LE additive_expression
                 | relational_expression GE additive_expression
                 ;

additive_expression: multiplicative_expression
               | additive_expression '+' multiplicative_expression
               | additive_expression '-' multiplicative_expression
               ;

multiplicative_expression: unary_expression
                   | multiplicative_expression '*' unary_expression
                   | multiplicative_expression '/' unary_expression
                   ;

unary_expression: postfix_expression
             | '+' unary_expression
             | '-' unary_expression
             | '!' unary_expression
             ;

postfix_expression: primary_expression
               | postfix_expression '[' expression ']'
               | postfix_expression '(' argument_expression_list_opt ')'
               | postfix_expression INC_OP
               | postfix_expression DEC_OP
               ;

argument_expression_list_opt: /* empty */
                         | argument_expression_list
                         ;

argument_expression_list: assignment_expression
                   | argument_expression_list ',' assignment_expression
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
