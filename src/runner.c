#include "runner.h"
#include "parser.h"
#include "lexer.h"

void runner(char *str) {
    yy_scan_string(str);
    yyparse();
}

