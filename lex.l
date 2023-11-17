%{
  #include <stdio.h>  
  #include "y.tab.h"
  
  extern int yyerror (char *msg);  

%}

%%

[ \t]                 ;
[ \n]                 {yylineno = yylineno + 1;}
","                   {return yytext[0];}
[0-9]+                {yylval.num = atoi(yytext); return NUMBER;}
"int"                 {return INT ;}
"char"                {return CHAR ;}
"long"                {return LONG;}
"vazio"               {return VOID ;}
"float"               {return FLOAT ;}
"double"              {return DOUBLE ;}
"booleano"            {return BOOLEAN;}
"para"                {return FOR ;}
"struct"              {return STRUCT ;}
"escreva"             {return PRINT ;}
"escreval"            {return PRINTF ;}
"leia"                {return SCANF ;}
"enquanto"            {return WHILE ;}
"se"      	          {return IF ;}
"senao se"            {return ELSE IF ;}
"senao"      	        {return ELSE ;}
"sair"                {return BREAK ;}
"continue"            {return CONTINUE ;}
"verdadeiro"          {return TRUE ;}
"falso"               {return FALSE ;}
"retorne"             {return RETURN ;}
"importe"             {return IMPORT ;}
"principal"           {return MAIN;}
";"      	            {return SEMICOLON ;}
"."                   {return COLON ;}
"="		                {return ASSIGN ;}
"+"                   {return PLUS ;}
"++"                  {return PLUSPLUS ;}
"-"                   {return MINUS ;}
"--"                  {return MINUSMINUS ;}
"*"                   {return TIMES ;}
"/"                   {return DIVIDE ;}
"%"                   {return REST_OF_DIVISION ;}
">"                   {return GT;}
"<"                   {return LT;}
"<="                  {return LE;}
">="                  {return GE;}
"=="                  {return EQ;}
"!="                  {return NE;}
"("                   {return yytext[0];}
")"                   {return yytext[0];}
"["                   {return yytext[0];}
"]"                   {return yytext[0];}
"{"                   {return yytext[0];}
"}"                   {return yytext[0];}
"&&"                  {return LOGIC_AND;}
"||"                  {return LOGIC_OR;}
"!"                   {return NOT;}
[a-zA-Z][a-zA-Z0-9]*	            {yylval.sValue = strdup(yytext);
                                    return ID;}

.                                 {yyerror("invalid character");}
%%

#ifndef yywrap
   int yywrap (void) {return 1;}
#endif

int main(void)
{
  yylex();
  return 0;
}
