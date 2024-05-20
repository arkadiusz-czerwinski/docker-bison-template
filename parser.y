



%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <iostream>
	
	void yyerror(char *s);
	int yylex();
	extern FILE* yyin;

   int counter = 0;
	
%}

%verbose 

%token PLUS TIMES NUMBER EQUAL
	
%%

total      : expression EQUAL                {  std::cout <<  $1 << std::endl;   }

expression : expression expression PLUS      {  $$ = $1 + $2;   }
           | expression expression TIMES     {  $$ = $1 * $2;   } 
           | NUMBER                          {  $$ = $1;   }
           ;
	
%%

void yyerror(char *s) 
{
    fprintf(stderr, "%s\n", s);
}

int main() 
{
    std::ios_base::sync_with_stdio (true);
    yyparse();    
    return 0;
}
