%pointer
%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>

 /* Definición de tokens */
enum yytokentype {
    NUMBER = 258,
    /* TODO 1 — Agregar IDENT = 259 en el enum */
IDENT = 259
};

int yylval;
%}

digito          [0-9]
letra           [a-zA-Z_]
identificador   {letra}({letra}|{digito})*

%%

 /* Reglas ya implementadas */
{digito}+  {
    yylval = atoi(yytext);
    printf("TOKEN NUMBER (%d) valor=%d\n", NUMBER, yylval);
    return NUMBER;
}

"+"  { printf("TOKEN '+'\n"); return '+'; }
"-"  { printf("TOKEN '-'\n"); return '-'; }
"*"  { printf("TOKEN '*'\n"); return '*'; }
"/"  { printf("TOKEN '/'\n"); return '/'; }

 /* TODO 2 — Agregar la regla para identificador que retorne el token IDENT
   Acción esperada: printf("TOKEN IDENT (%d) lexema=%s\n", IDENT, yytext);
   Y retornar IDENT.                                                        */
{identificador}  {
    printf("TOKEN IDENT (%d) lexema=%s\n", IDENT, yytext);
    return IDENT;
}
[ \t\n]  { }

.  { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    int token;
    while ((token = yylex()) != 0) { }
    return 0;
}
