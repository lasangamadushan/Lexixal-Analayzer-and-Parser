%{                                                                                          
#include "lex.tab.h"                                                                     
extern int line_number;                                                                     
%}                                                                                          
%option noyywrap

%%

"/*"((\*+[^/*])|([^*]))*\**"*/"	{}

	                                                                                          
"else"		{return ELSE;}
"if"		{return IF;}
"int"   	{return INT;}
"return"	{return RETURN;}
"void"		{return VOID;}
"while"		{return WHILE;}



"<="		{return GE;}
">="		{return LE;}
"=="		{return EQ;}
"!="		{return NE;}

"("		{return '(';}
")"		{return ')';}
"{"		{return '{';}
"}"		{return '}';}
"["		{return '[';}
"]"		{return ']';}
"-"		{return '-';}
"+"		{return '+';}
"*"		{return '*';}
"/"		{return '/';}
"<"		{return '<';}
">"		{return '>';}
"="		{return '=';}
";"		{return ';';}
","		{return ',';}

[a-zA-Z][a-zA-Z]*	{return ID;}
[0-9][0-9]*		{return NUM;}
                                                                    
%%

