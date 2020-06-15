#include <glib.h>

#include "lexer.h"
#include "parser.h"

int main(void)
{
    g_print("Parser.\n");

    yyin = stdin;
    yyparse();
}
