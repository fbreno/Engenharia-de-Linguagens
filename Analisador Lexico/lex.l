%{
  #include <stdio.h>  
%}

%%

[ \t]                 ;
[ \n]                 {yylineno = yylineno + 1;}
","                   {printf("COMMA \n");}
[0-9]+                {printf("NUMBER(%s)\n",yytext);}
(\/\*([^*]|[\r\n]|(\*+([^*\/]|[\r\n])))*\*+\/)|(\/\/.*) {printf("Comment: %s.\n", yytext);}

"int"                 {printf("INT \n");}
"char"                {printf("CHAR \n");}
"short"               {printf("SHORT \n");}
"long"                {printf("LONG\n");}
"vazio"               {printf("VOID \n");}
"float"               {printf("FLOAT \n");}
"double"              {printf("DOUBLE \n");}

"para"                {printf("FOR \n");}
"struct"              {printf("STRUCT \n");}
"escreva"             {printf("PRINT \n");}
"escreval"            {printf("PRINTF \n");}
"leia"                {printf("SCANF \n");}
"enquanto"            {printf("WHILE \n");}
"se"      	          {printf("IF \n");}
"senao se"            {printf("ELSE IF \n");}
"senao"      	        {printf("ELSE \n");}
"sair"                {printf("BREAK \n");}
"continue"            {printf("CONTINUE \n");}
"verdadeiro"          {printf("TRUE \n");}
"falso"               {printf("FALSE \n");}
"retorne"             {printf("RETURN \n");}
"importe"             {printf("IMPORT \n");}

";"      	            {printf("SEMICOLON \n");}
"."                   {printf("COLON \n");}
"="		                {printf("ASSIGN \n");}
"+"                   {printf("PLUS \n");}
"++"                  {printf("PLUSPLUS \n");}
"-"                   {printf("MINUS \n");}
"--"                  {printf("MINUSMINUS \n");}
"*"                   {printf("TIMES \n");}
"/"                   {printf("DIVIDE \n");}
"%"                   {printf("REST_OF_DIVISION \n");}

">"                   {printf ("GT \n");}
"<"                   {printf ("LT \n");}
"<="                  {printf ("LE \n");}
">="                  {printf ("GE \n");}
"=="                  {printf ("EQ \n");}
"!="                  {printf ("NE \n");}

"("                   {printf("LEFT_PARENTHESIS \n");}
")"                   {printf("RIGHT_PARENTHESIS \n");}
"["                   {printf("LEFT_BRACKET \n");}
"]"                   {printf("RIGHT_BRACKET \n");}
"{"                   {printf("LEFT_BRACE \n");}
"}"                   {printf("RIGHT_BRACE \n");}

"&&"                  {printf("LOGIC_AND \n");}
"||"                  {printf("LOGIC_OR \n");}
"!"                   {printf("NOT \n");}

[a-zA-Z][a-zA-Z0-9]*  {printf("ID(%s)\n",yytext);}
.                     {printf("invalid character \n");}

%%

#ifndef yywrap
   int yywrap (void) {return 1;}
#endif

int main(void)
{
  yylex();
  return 0;
}
