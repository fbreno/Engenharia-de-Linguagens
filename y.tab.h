/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INT = 258,                     /* INT  */
    CHAR = 259,                    /* CHAR  */
    SHORT = 260,                   /* SHORT  */
    LONG = 261,                    /* LONG  */
    VOID = 262,                    /* VOID  */
    FLOAT = 263,                   /* FLOAT  */
    DOUBLE = 264,                  /* DOUBLE  */
    BOOLEAN = 265,                 /* BOOLEAN  */
    FOR = 266,                     /* FOR  */
    STRUCT = 267,                  /* STRUCT  */
    PRINT = 268,                   /* PRINT  */
    PRINTF = 269,                  /* PRINTF  */
    SCANF = 270,                   /* SCANF  */
    WHILE = 271,                   /* WHILE  */
    IF = 272,                      /* IF  */
    ELSE = 273,                    /* ELSE  */
    BREAK = 274,                   /* BREAK  */
    CONTINUE = 275,                /* CONTINUE  */
    TRUE = 276,                    /* TRUE  */
    FALSE = 277,                   /* FALSE  */
    RETURN = 278,                  /* RETURN  */
    IMPORT = 279,                  /* IMPORT  */
    SEMICOLON = 280,               /* SEMICOLON  */
    COLON = 281,                   /* COLON  */
    ASSIGN = 282,                  /* ASSIGN  */
    PLUS = 283,                    /* PLUS  */
    PLUSPLUS = 284,                /* PLUSPLUS  */
    MINUS = 285,                   /* MINUS  */
    MINUSMINUS = 286,              /* MINUSMINUS  */
    TIMES = 287,                   /* TIMES  */
    DIVIDE = 288,                  /* DIVIDE  */
    REST_OF_DIVISION = 289,        /* REST_OF_DIVISION  */
    GT = 290,                      /* GT  */
    LT = 291,                      /* LT  */
    LE = 292,                      /* LE  */
    GE = 293,                      /* GE  */
    EQ = 294,                      /* EQ  */
    NE = 295,                      /* NE  */
    LEFT_PARENTHESIS = 296,        /* LEFT_PARENTHESIS  */
    RIGHT_PARENTHESIS = 297,       /* RIGHT_PARENTHESIS  */
    NUMBER = 298,                  /* NUMBER  */
    ID = 299,                      /* ID  */
    LEFT_BRACKET = 300,            /* LEFT_BRACKET  */
    RIGHT_BRACKET = 301,           /* RIGHT_BRACKET  */
    LEFT_BRACE = 302,              /* LEFT_BRACE  */
    RIGHT_BRACE = 303,             /* RIGHT_BRACE  */
    LOGIC_AND = 304,               /* LOGIC_AND  */
    LOGIC_OR = 305,                /* LOGIC_OR  */
    NOT = 306,                     /* NOT  */
    IFX = 307                      /* IFX  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define INT 258
#define CHAR 259
#define SHORT 260
#define LONG 261
#define VOID 262
#define FLOAT 263
#define DOUBLE 264
#define BOOLEAN 265
#define FOR 266
#define STRUCT 267
#define PRINT 268
#define PRINTF 269
#define SCANF 270
#define WHILE 271
#define IF 272
#define ELSE 273
#define BREAK 274
#define CONTINUE 275
#define TRUE 276
#define FALSE 277
#define RETURN 278
#define IMPORT 279
#define SEMICOLON 280
#define COLON 281
#define ASSIGN 282
#define PLUS 283
#define PLUSPLUS 284
#define MINUS 285
#define MINUSMINUS 286
#define TIMES 287
#define DIVIDE 288
#define REST_OF_DIVISION 289
#define GT 290
#define LT 291
#define LE 292
#define GE 293
#define EQ 294
#define NE 295
#define LEFT_PARENTHESIS 296
#define RIGHT_PARENTHESIS 297
#define NUMBER 298
#define ID 299
#define LEFT_BRACKET 300
#define RIGHT_BRACKET 301
#define LEFT_BRACE 302
#define RIGHT_BRACE 303
#define LOGIC_AND 304
#define LOGIC_OR 305
#define NOT 306
#define IFX 307

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
