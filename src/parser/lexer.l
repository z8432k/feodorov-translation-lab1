%option noyywrap

%{

#include <stdio.h>

#include "parser.h"

size_t count = 0;

%}

WS              [ \t\n\r\v]+
K_CHAR          [k]
M_CHAR          [m]
N_CHAR          [n]
MUL             [*]
ADD             [+]

%%
{WS}            {}

{K_CHAR} {
                printf("Found 'k'\n");
                count++;

                return K_CHAR;
}

{M_CHAR} {
                printf("Found 'm'\n");
                count++;

                return M_CHAR;
}

{N_CHAR} {
                printf("Found 'n'\n");
                count++;

                return N_CHAR;
}

{MUL} {
                printf("Found '+'\n");
                count++;

                return MUL;
}

{ADD} {
                printf("Found '+'\n");
                count++;

                return ADD;
}
%%
