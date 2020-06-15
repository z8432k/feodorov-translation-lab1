%{
                #include <stdio.h>
                #include <stdlib.h>

                extern int yylex (void);


                void yyerror(const char* s);
%}

%token WS K_CHAR M_CHAR N_CHAR MUL ADD

%start begin

%%

begin:          expression
                {
                                printf("begin detected.\n");
                }
;

expression:     expression ADD multiply
                | multiply
                {
                                printf("expression detected\n");
                }
;

multiply:       multiply MUL term
                | term
                {
                                printf("multiply detecte\n");
                }
;

term:           K_CHAR
                | M_CHAR
                | N_CHAR
                {
                                printf("term detected\n");
                }
;

%%

void yyerror(const char* s) {
                fprintf(stderr, "Parse error: %s\n", s);
                exit(1);
}
