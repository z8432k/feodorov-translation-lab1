%{

  #include <stdio.h>
  #include <stdlib.h>

  extern int yylex (void);


  void yyerror(const char* s);

%}

%token WS K_CHAR M_CHAR N_CHAR MUL ADD

%start begin

%%

begin:
  expression                { printf("Axioma detected.\n"); }
;

expression:
  expression ADD multiply   { printf("expression + multiply detected.\n"); }
  | multiply                { printf("multiply detected.\n"); }
;

multiply:
  multiply MUL term         {
                              printf("multiply * term detected.\n");
                            }
  | term                    {
                              printf("term detected.\n");
                            }
;

term:
  K_CHAR                    { printf("k detected.\n");}
  | M_CHAR                  { printf("m detected.\n");}
  | N_CHAR                  { printf("n detected.\n");}
;

%%

void yyerror(const char* s) {
  fprintf(stderr, "\n\tParse error: %s\n", s);
  exit(1);
}
