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

//    # define YYINITDEPTH 1000000
 //   # define YYMAXDEPTH 1000000
  //  # define YYDEBUG 0
  //  # define YYSTACK_ALLOC_MAXIMUM 1000000

    char decode[10000];
    int ptr = 0;
    void AddChar(char c){
        decode[ptr] = c;
        ptr++;
    }
%}

%union{
    char name;
}

%token<name> SYMBOL
%token NOTINTHEABC


%%

E:  S E
    | 
     ;

S:  SYMBOL { AddChar($1); };



%%


int main(){
    int ret = yyparse();
    if (ret == 0){

        for(int i = 0; i < ptr; i++){
            cout << decode[i];
        }
        cout << endl;

        cout<<"<ACC>\n";
    } 
    else cout<<"ERROR: " << ret << "\n";
    return 0;
}
