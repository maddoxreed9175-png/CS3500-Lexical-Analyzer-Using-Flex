/* A starting flex file */
		               /* ---- PREAMBLE ---- */
%{
#include <iostream>
using namespace std;

int no_lines = 0;
int tokens = 0;
//{ cout << tokens; << ": TOKEN: BLANK\tLEXEME: " << yytext << endl; tokens += 1; }
%}
		              /* ---- DEFINITIONS ---- */
%option noyywrap
INTEGER [+-]{0,1}[0-9]+
DECIMAL {INTEGER}[.][0-9]+

%%		              /* ---- REGULAR EXPRESSIONS ---- */

[ \t\r]+    {/* whitespace */}
%.*             { /* comment: ignore to end of line */ }
\n              { no_lines++; }


{INTEGER}    { cout << tokens << ": TOKEN: INTCONST\tLEXEME: " << yytext << endl; tokens += 1; }
{DECIMAL}    { cout << tokens << ": TOKEN: DECCONST\tLEXEME: " << yytext << endl; tokens += 1; }
{DECIMAL}[E]{INTEGER}    { cout << tokens << ": TOKEN: SCICONST\tLEXEME: " << yytext << endl; tokens += 1; }
[0-9ABCDEF]+[H]    { cout << tokens << ": TOKEN: HEXCONST\tLEXEME: " << yytext << endl; tokens += 1; }
[01]+[B]    { cout << tokens << ": TOKEN: BINCONST\tLEXEME: " << yytext << endl; tokens += 1; }
FOO|IF|FI|ELSE|LOOP|POOL|PRINT    { cout << tokens << ": TOKEN: KEYWORD\tLEXEME: " << yytext << endl; tokens += 1; }
\"[^ \"\n]+\"    { cout << tokens << ": TOKEN: STRCONST\tLEXEME: " << yytext << endl; tokens += 1; }
[0-9ABCDEF]{2}[X]    { cout << tokens << ": TOKEN: CHCONST\tLEXEME: " << yytext << endl; tokens += 1; }
[AGJDPL][0-9]{1,2}[AKMNY][0-9]{0,2}(-[AGJDPL]){0,1}    { cout << tokens << ": TOKEN: AIRCRAFT\tLEXEME: " << yytext << endl; tokens += 1; }
[a-zA-Z][a-zA-Z0-9_]*    { cout << tokens << ": TOKEN: IDENT\tLEXEME: " << yytext << endl; tokens += 1; }
\+|-|\*|\/|<|>|=|&|#    { cout << tokens << ": TOKEN: OPERATOR\tLEXEME: " << yytext << endl; tokens += 1; }
([0-9]{3}\.[0-9]{3}\.[0-9]{4})|(\([0-9]{3}\)[0-9]{3}-[0-9]{4})|([0-9]{3}-[0-9]{3}-[0-9]{4})    { cout << tokens << ": TOKEN: PHONE\tLEXEME: " << yytext << endl; tokens += 1; }

.             { cout << tokens << ": TOKEN: ?\t\tLEXEME: " << yytext << endl; tokens += 1; }

%%		              /* ---- CODA ---- */

int main()
{
    yylex();
    cout << no_lines << " lines processed." << endl;
    return 0;
}

