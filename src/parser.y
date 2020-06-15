%{
                #include <stdio.h>
                #include <stdlib.h>

                void yyerror(const char* s);
%}

%token WS K_CHAR M_CHAR N_CHAR MUL ADD

%start expression

%%

expression:
                | N_CHAR
                {
                                printf("expression detected.\n");
                }
;

%%

void yyerror(const char* s) {
                fprintf(stderr, "Parse error: %s\n", s);
                exit(1);
}
