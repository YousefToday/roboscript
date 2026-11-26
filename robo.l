%option noyywrap yylineno

%{
#include <stdio.h>
#include <string.h>
#include "robo.tab.h"

int lexical_errors = 0;
extern int semantic_errors;
%}

%%

"robot"       { return ROBOT; }
"task"        { return TASK; }
"begin"       { return BEGIN_KW; }
"end"         { return END; }
"num"         { return NUM; }
"text"        { return TEXT; }
"const"       { return CONST; }
"when"        { return WHEN; }
"then"        { return THEN; }
"orwhen"      { return ORWHEN; }
"otherwise"   { return OTHERWISE; }
"repeat"      { return REPEAT; }
"times"       { return TIMES; }
"move"        { return MOVE; }
"turn"        { return TURN; }
"say"         { return SAY; }
"scan"        { return SCAN; }
"do"          { return DO; }

"+"           { return PLUS; }
"-"           { return MINUS; }
"*"           { return MULT; }
"/"           { return DIV; }
"%"           { return MOD; }

":="          { return ASSIGN; }
"="           { return EQ; }
"!="          { return NE; }
"<"           { return LT; }
"<="          { return LE; }
">"           { return GT; }
">="          { return GE; }

"("           { return LPAREN; }
")"           { return RPAREN; }
";"           { return SEMI; }
","           { return COMMA; }
"."           { return DOT; }

[a-z][a-zA-Z0-9_]*      { yylval.name = strdup(yytext); return ID; }
[0-9]+(\.[0-9]+)?       { return NUM_LITERAL; }
"'"[^'\n]*"'"           { return TEXT_LITERAL; }

\{[^}]*\}               {}
[ \t\r\n]+              {}

. {
    printf("Lexical error at line %d: invalid character '%c'\n",
           yylineno, yytext[0]);
    lexical_errors = 1;
}

%%

void yyerror(const char *message)
{
    printf("Syntax error at line %d\n", yylineno);
}

int main(int argc, char *argv[])
{
    if (argc < 2)
        return 1;

    yyin = fopen(argv[1], "r");
    if (yyin == NULL)
        return 1;

    int result = yyparse();
    fclose(yyin);

    if (result != 0)
        return 1;

    if (lexical_errors || semantic_errors) {
        printf("Parsing completed with errors.\n");
        return 1;
    }

    printf("Parsing completed successfully: no errors.\n");
    return 0;
}