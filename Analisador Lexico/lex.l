%{
  #include <stdio.h>  
%}

%%

[ \t]                 ;
[ \n]                 {yylineno = yylineno + 1;}
","                   {return COMMA ;}
[0-9]+                {yylval.num = atoi(yytext); return NUMBER;}
"/*"                   { /* Início de um comentário em bloco */
                        while (1) {
                            char c = input();
                            if (c == EOF) {
                                fprintf(stderr, "Comentário em bloco não fechado\n");
                                break;
                            } else if (c == '*' && input() == '/') {
                                break; // Fim do comentário em bloco
                            }
                        }
                      }

"//"                   { /* Início de um comentário de linha */
                        while (1) {
                            char c = input();
                            if (c == EOF || c == '\n') {
                                unput(c);
                                break; // Fim do comentário de linha
                            }
                        }
                      }

"int"                 {return INT ;}
"char"                {return CHAR ;}
"short"               {return SHORT ;}
"long"                {return LONG;}
"vazio"               {return VOID ;}
"float"               {return FLOAT ;}
"double"              {return DOUBLE ;}
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
"("                   {return LEFT_PARENTHESIS;}
")"                   {return RIGHT_PARENTHESIS;}
"["                   {return LEFT_BRACKET;}
"]"                   {return RIGHT_BRACKET;}
"{"                   {return LEFT_BRACE;}
"}"                   {return RIGHT_BRACE;}
"&&"                  {return LOGIC_AND;}
"||"                  {return LOGIC_OR;}
"!"                   {return NOT;}
[a-zA-Z][a-zA-Z0-9]*  {return ID(%s)\n",yytext;}
.                     {return invalid character;}
%%

#ifndef yywrap
   int yywrap (void) {return 1;}
#endif

int main(void)
{
  yylex();
  return 0;
}
