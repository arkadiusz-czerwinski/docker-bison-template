.PHONY: clean

__start__: compiler
	./compiler

compiler: lex.yy.c parser.tab.c
	g++ -std=c++14 parser.tab.c lex.yy.c -o compiler

parser.tab.c: parser.y
	bison parser.y --defines
	
lex.yy.c: lexer.l  
	flex lexer.l 
	
clean : 
	rm *.c *.h *.output compiler 
