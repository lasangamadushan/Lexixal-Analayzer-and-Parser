%{                                                                                   
   #include <stdarg.h> 
   #include "lex_shared.h"                                                        
   #define YYSTYPE char *                                                                       
   int indent=0;                                                                     
   char *iden_dum;                                                                   
%}                                                                                   
%token ELSE
%token IF                                                                         
%token INT                                                                           
%token RETURN
%token VOID
%token WHILE
%token '-' '*' '+' '/' '<' '>' '=' ';' ',' '{' '}' '(' ')' '[' ']'
%token ID
%token NUM
%token GE
%token LE
%token EQ
%token NE
                                                                    
 
%%
program: declaration-list;
declaration-list: declaration-list declaration | declaration;
declaration: var-declaration | fun-declaration;
var-declaration: type-specifier ID';' | type-specifier ID'['NUM']'';';
type-specifier: INT | VOID;
fun-declaration: type-specifier ID'('params')' compound-stmt;
params: param-list | VOID;
param-list: param-list ',' param | param;
param: type-specifier ID | type-specifier ID'['']';
compound-stmt: '{' local-declarations statement-list '}';
local-declarations: local-declarations var-declaration | empty;
statement-list: statement-list statement | empty;
statement: expression-stmt | compound-stmt | selection-stmt | iteration-stmt | return-stmt;
expression-stmt: expression ';' | ';';
selection-stmt: IF'(' expression ')' statement | IF'(' expression ')' statement ELSE statement;
iteration-stmt: WHILE '(' expression ')' statement;
return-stmt: RETURN ';' | RETURN expression ';';
expression: var '=' expression | simple-expression;
var: ID | ID '[' expression ']';
simple-expression: additive-expression relop additive-expression | additive-expression;
relop: '<'| GE |'>'| LE | EQ | NE;
additive-expression: additive-expression addop term | term;
addop: '+'|'-';
term: term mulop factor | factor;
mulop: '*' | '/';
factor: '(' expression ')' | var | call | NUM;
call: ID '(' args ')';
args: arg-list | empty;
arg-list: arg-list ',' expression | expression;
empty:;
                                                                  
%%                                                                                   

void yyerror (char const *s) {
  fprintf (stderr, "%s\n", s);
}

main ()                                                                              
{                                                                                    
  yyparse ();                                                                        
}
