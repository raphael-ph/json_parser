
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[0-9.]+ {
	return N;
}

(\"[A-Za-z0-9 ]+\") {
	return STR;
}

, {
	return ',';
}


[\:] {
	return ':';
}

\{ {
	return '{';
}


\} {
	return '}';
}

\[ {
	return '[';

}

\] {
	return ']';
}

[\n] ;
[[:space:]]+ ; 
. ;

%%

int yywrap() {
  return 1;
}
