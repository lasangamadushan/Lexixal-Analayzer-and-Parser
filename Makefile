lex: lex.yy.o lex.tab.o
	gcc -o lex $^

lex.tab.h: lex.y
	bison --debug --verbose -d lex.y

lex.tab.c: lex.y
	bison -d lex.y

lex.yy.c: lex.flex lex.tab.h
	flex  lex.flex
