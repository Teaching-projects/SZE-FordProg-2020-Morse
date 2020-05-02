
%{
    #include "grammar.tab.h"
    #include <cstring>
    #include <iostream>
    using namespace std;
%}


%option noyywrap

ROVID [\.]
HOSSZU [\-]
BREAK [\ ]
SZOKOZ [\/]

DIGITS  [0-9]
ALPHABET [a-zA-Z]

%%
{ROVID}{BREAK}											yylval.name='E'; return SYMBOL;
{ROVID}{ROVID}{BREAK}									yylval.name='I'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{BREAK}							yylval.name='S'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{ROVID}{BREAK}						yylval.name='H'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{ROVID}{ROVID}{BREAK}				yylval.name='5'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{ROVID}{HOSSZU}{BREAK}				yylval.name='4'; return SYMBOL;

{ROVID}{ROVID}{ROVID}{HOSSZU}{BREAK}					yylval.name='V'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{HOSSZU}{HOSSZU}{BREAK}			yylval.name='3'; return SYMBOL;

{ROVID}{ROVID}{HOSSZU}{BREAK}							yylval.name='U'; return SYMBOL;
{ROVID}{ROVID}{HOSSZU}{ROVID}{BREAK}					yylval.name='F'; return SYMBOL;
{ROVID}{ROVID}{HOSSZU}{HOSSZU}{HOSSZU}{BREAK}			yylval.name='2'; return SYMBOL;


{ROVID}{HOSSZU}{BREAK}									yylval.name='A'; return SYMBOL;
{ROVID}{HOSSZU}{ROVID}{BREAK}							yylval.name='R'; return SYMBOL;
{ROVID}{HOSSZU}{ROVID}{ROVID}{BREAK}					yylval.name='L'; return SYMBOL;
{ROVID}{HOSSZU}{HOSSZU}{BREAK}							yylval.name='W'; return SYMBOL;
{ROVID}{HOSSZU}{HOSSZU}{ROVID}{BREAK}					yylval.name='P'; return SYMBOL;
{ROVID}{HOSSZU}{HOSSZU}{HOSSZU}{BREAK}					yylval.name='J'; return SYMBOL;
{ROVID}{HOSSZU}{HOSSZU}{HOSSZU}{HOSSZU}{BREAK}			yylval.name='1'; return SYMBOL;


{HOSSZU}{BREAK}											yylval.name='T'; return SYMBOL;
{HOSSZU}{ROVID}{BREAK}									yylval.name='N'; return SYMBOL;
{HOSSZU}{ROVID}{ROVID}{BREAK}							yylval.name='D'; return SYMBOL;
{HOSSZU}{ROVID}{ROVID}{ROVID}{BREAK}					yylval.name='B'; return SYMBOL;
{HOSSZU}{ROVID}{ROVID}{ROVID}{ROVID}{BREAK}				yylval.name='6'; return SYMBOL;
{HOSSZU}{ROVID}{ROVID}{HOSSZU}{BREAK}					yylval.name='X'; return SYMBOL;
{HOSSZU}{ROVID}{HOSSZU}{BREAK}							yylval.name='K'; return SYMBOL;
{HOSSZU}{ROVID}{HOSSZU}{ROVID}{BREAK}					yylval.name='C'; return SYMBOL;
{HOSSZU}{ROVID}{HOSSZU}{HOSSZU}{BREAK}					yylval.name='Y'; return SYMBOL;

{HOSSZU}{HOSSZU}{BREAK}									yylval.name='M'; return SYMBOL;
{HOSSZU}{HOSSZU}{ROVID}{BREAK}							yylval.name='G'; return SYMBOL;
{HOSSZU}{HOSSZU}{ROVID}{ROVID}{BREAK}					yylval.name='Z'; return SYMBOL;
{HOSSZU}{HOSSZU}{ROVID}{ROVID}{ROVID}{BREAK}			yylval.name='7'; return SYMBOL;
{HOSSZU}{HOSSZU}{ROVID}{HOSSZU}{BREAK}					yylval.name='Q'; return SYMBOL;
{HOSSZU}{HOSSZU}{HOSSZU}{BREAK}							yylval.name='O'; return SYMBOL;
{HOSSZU}{HOSSZU}{HOSSZU}{HOSSZU}{HOSSZU}{BREAK}			yylval.name='0'; return SYMBOL;
{HOSSZU}{HOSSZU}{HOSSZU}{HOSSZU}{ROVID}{BREAK}			yylval.name='9'; return SYMBOL;


{SZOKOZ}{BREAK}											yylval.name=' '; return SYMBOL;

{HOSSZU}{HOSSZU}{ROVID}{ROVID}{HOSSZU}{HOSSZU}{BREAK}   yylval.name=','; return SYMBOL;
{ROVID}{HOSSZU}{ROVID}{HOSSZU}{ROVID}{HOSSZU}{BREAK}    yylval.name='.'; return SYMBOL;

\n                              return '\0';

{ALPHABET}({ALPHABET}|{DIGITS})*    					return NOTINTHEABC;

%% 


