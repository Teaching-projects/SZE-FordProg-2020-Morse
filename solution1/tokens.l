
%{
    #include "grammar.tab.h"
    #include <cstring>
    #include <iostream>
    using namespace std;
%}


%option noyywrap



%%
[\.]                   			return ROVID;
[\-]                   			return HOSSZU;

[ ]                           	return BREAK;
\n                              return '\0';



%% 


