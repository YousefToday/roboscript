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

#ifndef YY_YY_ROBO_TAB_H_INCLUDED
# define YY_YY_ROBO_TAB_H_INCLUDED
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
    ROBOT = 258,                   /* ROBOT  */
    TASK = 259,                    /* TASK  */
    BEGIN_KW = 260,                /* BEGIN_KW  */
    END = 261,                     /* END  */
    NUM = 262,                     /* NUM  */
    TEXT = 263,                    /* TEXT  */
    CONST = 264,                   /* CONST  */
    WHEN = 265,                    /* WHEN  */
    THEN = 266,                    /* THEN  */
    OTHERWISE = 267,               /* OTHERWISE  */
    REPEAT = 268,                  /* REPEAT  */
    TIMES = 269,                   /* TIMES  */
    MOVE = 270,                    /* MOVE  */
    TURN = 271,                    /* TURN  */
    SAY = 272,                     /* SAY  */
    SCAN = 273,                    /* SCAN  */
    DO = 274,                      /* DO  */
    PLUS = 275,                    /* PLUS  */
    MINUS = 276,                   /* MINUS  */
    MULT = 277,                    /* MULT  */
    DIV = 278,                     /* DIV  */
    MOD = 279,                     /* MOD  */
    ASSIGN = 280,                  /* ASSIGN  */
    EQ = 281,                      /* EQ  */
    NE = 282,                      /* NE  */
    LT = 283,                      /* LT  */
    LE = 284,                      /* LE  */
    GT = 285,                      /* GT  */
    GE = 286,                      /* GE  */
    LPAREN = 287,                  /* LPAREN  */
    RPAREN = 288,                  /* RPAREN  */
    SEMI = 289,                    /* SEMI  */
    COMMA = 290,                   /* COMMA  */
    DOT = 291,                     /* DOT  */
    ID = 292,                      /* ID  */
    NUM_LITERAL = 293,             /* NUM_LITERAL  */
    TEXT_LITERAL = 294             /* TEXT_LITERAL  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_ROBO_TAB_H_INCLUDED  */
