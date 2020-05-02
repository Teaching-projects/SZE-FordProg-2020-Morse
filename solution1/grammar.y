%{
    #include <iostream>
    #include <map>
    #include <string>
    #include <stdio.h>
    using namespace std;
    int yylex();
    int yyerror(char* message){
        return 1;
    }

    map<string,int> identifiers;

    char decode[100];
    int ptr = 0;
    void AddChar(char c){
        decode[ptr] = c;
        ptr++;
    }
%}

%union{
    char name;
}

%token BREAK
%token ROVID
%token HOSSZU


%%

E:  S E
    | 
     ;

S:  ROVID R ;

R:  ROVID R1 
    | BREAK { AddChar('E'); };
R1: ROVID R2 
    | BREAK  { AddChar('I'); };
R2: ROVID R3 
    | BREAK { AddChar('S'); };
R3:  ROVID R4 
    | HOSSZU H1
    | BREAK { AddChar('H'); };
R4: BREAK { AddChar('5'); };

H1: BREAK { AddChar('4'); };

%%


int main(){
    if (yyparse() == 0){

        for(int i = 0; i < ptr; i++){
            cout << decode[i];
        }
        cout << endl;

        cout<<"<ACC>\n";
    } 
    else cout<<"ERROR\n";
    return 0;
}
