#include <glib.h>

#include "lexer.h"
#include "parser.h"

int main(void)
{
    g_print("Parser is running.\n");

    yyin = stdin;
    yyparse();
}
