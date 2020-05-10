
%{
    #include "grammar.tab.h"
    #include <cstring>
    #include <iostream>
    using namespace std;
%}


%option noyywrap



%%
[\.]                   			return SHORT;
[\-]                   			return LONG;
[/]                  			return SPACE;

[ ]                           	return BREAK;
\n                              return '\0';



%% 


