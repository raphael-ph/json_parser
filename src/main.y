

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}
// objetos finais: número, string, vírgula, dois pontos, chaves, colchetes
%token N STR ',' ':' '{' '}' '[' ']'

%%

S:
	OBJ {printf("VALIDO\n");}
	|
	;

// um objeto pode ser vazio ou pode ser um conjunto de nomes e valores => par
OBJ:
	'{' '}' {}
	| '{' PAIR '}' {}
	;

// o par é definido como um conjunto nome/valor ou um conjunto de pares
PAIR:
	STR ':' VALUE {}
	| PAIR ',' PAIR {}
	;

// o array pode ser definido como um espaço vazio ou um conjunto de valores
ARRAY:
	'[' ']' {}
	| '[' MULT_VALUES ']' {}
	;

// o array pode ser de um valor só ou de múltiplos valores
MULT_VALUES:
	VALUE {}
	| MULT_VALUES ',' VALUE { }
	;	
			
VALUE:
	STR {}
	| N {}
	| OBJ {}
	| ARRAY {}
	;

%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
  return 0;

}
