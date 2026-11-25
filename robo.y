%{
#include <stdio.h>

extern FILE *yyin;
extern int yylineno;
extern int lexical_errors;

int yylex(void);
void yyerror(const char *message);
%}

%token ROBOT TASK BEGIN_KW END
%token NUM TEXT CONST
%token WHEN THEN ORWHEN OTHERWISE REPEAT TIMES
%token MOVE TURN SAY SCAN DO
%token PLUS MINUS MULT DIV MOD
%token ASSIGN EQ NE LT LE GT GE
%token LPAREN RPAREN SEMI COMMA DOT
%token ID NUM_LITERAL TEXT_LITERAL

%%
Program: ROBOT ID SEMI tasks main_block;
tasks: tasks task_def | ;
task_def: TASK ID BEGIN_KW statements END SEMI;
main_block: BEGIN_KW statements END DOT;


statements: statements statement | statement;
statement: simple_stmt SEMI | when_stmt | repeat_stmt;
simple_stmt: decl | const_decl | assign_stmt | move_stmt | turn_stmt | say_stmt | scan_stmt | call_stmt;
decl: type ID;
type: NUM | TEXT;
const_decl: CONST ID ASSIGN literal;
literal: NUM_LITERAL | TEXT_LITERAL;
assign_stmt: ID ASSIGN expression;


move_stmt: MOVE expression;
turn_stmt: TURN expression;
say_stmt: SAY expression_list;
scan_stmt: SCAN ID;
call_stmt: DO ID;
when_stmt: WHEN expression THEN statements orwhens END | WHEN expression THEN statements orwhens OTHERWISE statements END;
orwhens: ORWHEN expression THEN statements orwhens| ;
repeat_stmt: REPEAT exp TIMES statements END;


expression: exp EQ exp | exp NE exp | exp LE exp | exp LT exp | exp GE exp | exp GT exp | exp;
exp: exp PLUS term | exp MINUS term | term;
term: term MULT factor | term DIV factor | term MOD factor | factor;
factor: LPAREN exp RPAREN | NUM_LITERAL | TEXT_LITERAL | ID;
expression_list: expression_list COMMA expression | expression; 