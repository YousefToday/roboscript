%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
int yylex(void);
void yyerror(const char *message);

typedef enum { SYM_VAR, SYM_CONST, SYM_TASK } SymbolKind;

typedef struct {
    char *name;
    SymbolKind kind;
} entry;

int semantic_errors = 0;
entry *table = NULL;
int count = 0;
int capacity = 0;

void add_entry(char *name, SymbolKind kind)
{
    if (count == capacity) {
        int new_capacity = capacity + 100;
        entry *new_table = realloc(table, new_capacity * sizeof(*table));

        if (new_table == NULL) {
            perror("realloc");
            exit(EXIT_FAILURE);
        }

        table = new_table;
        capacity = new_capacity;
    }

    table[count].name = name;
    table[count].kind = kind;
    count++;
}

entry *find_entry(const char *name)
{
    for (int i = 0; i < count; i++) {
        if (strcmp(table[i].name, name) == 0)
            return &table[i];
    }
    return NULL;
}
%}

%union {
    char *name;
}

%token ROBOT TASK BEGIN_KW END
%token NUM TEXT CONST
%token WHEN THEN ORWHEN OTHERWISE REPEAT TIMES
%token MOVE TURN SAY SCAN DO
%token PLUS MINUS MULT DIV MOD
%token ASSIGN EQ NE LT LE GT GE
%token LPAREN RPAREN SEMI COMMA DOT
%token <name> ID
%token NUM_LITERAL TEXT_LITERAL

%%

Program: ROBOT ID SEMI tasks main_block;

tasks: tasks task_def | %empty;

task_def:
    TASK ID { add_entry($2, SYM_TASK); } BEGIN_KW statements END SEMI
    ;

main_block: BEGIN_KW statements END DOT;

statements: statements statement | statement;
statement: simple_stmt SEMI | when_stmt | repeat_stmt;

simple_stmt:
    decl | const_decl | assign_stmt | move_stmt | turn_stmt
    | say_stmt | scan_stmt | call_stmt
    ;

decl: type ID { add_entry($2, SYM_VAR); };
type: NUM | TEXT;

const_decl:
    CONST ID ASSIGN literal { add_entry($2, SYM_CONST); }
    ;

literal: NUM_LITERAL | TEXT_LITERAL;

assign_stmt:
    ID ASSIGN expression {
        entry *e = find_entry($1);
        if (e != NULL && e->kind == SYM_CONST) {
            printf("Semantic error at line %d: cannot modify constant '%s'\n",
                   yylineno, $1);
            semantic_errors = 1;
        }
    }
    ;

move_stmt: MOVE expression;
turn_stmt: TURN expression;
say_stmt: SAY expression_list;

scan_stmt:
    SCAN ID {
        entry *e = find_entry($2);
        if (e != NULL && e->kind == SYM_CONST) {
            printf("Semantic error at line %d: cannot modify constant '%s'\n",
                   yylineno, $2);
            semantic_errors = 1;
        }
    }
    ;

call_stmt:
    DO ID {
        entry *e = find_entry($2);
        if (e == NULL || e->kind != SYM_TASK) {
            printf("Semantic error at line %d: call to undefined task '%s'\n",
                   yylineno, $2);
            semantic_errors = 1;
        }
    }
    ;

when_stmt:
    WHEN expression THEN statements orwhens END
    | WHEN expression THEN statements orwhens OTHERWISE statements END
    ;

orwhens: ORWHEN expression THEN statements orwhens | %empty;

repeat_stmt: REPEAT exp TIMES statements END;

expression:
    exp EQ exp | exp NE exp | exp LE exp | exp LT exp
    | exp GE exp | exp GT exp | exp
    ;

exp: exp PLUS term | exp MINUS term | term;
term: term MULT factor | term DIV factor | term MOD factor | factor;
factor: LPAREN exp RPAREN | NUM_LITERAL | TEXT_LITERAL | ID;
expression_list: expression_list COMMA expression | expression;

%%