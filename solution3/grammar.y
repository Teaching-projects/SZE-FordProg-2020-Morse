%{
    #include <iostream>
    #include <map>
    #include <string>
    #include <stdio.h>
    #include <chrono> 

    using namespace std::chrono; 
    using namespace std;

    int yylex();
    int yyerror(char* message){
        return 1;
    }

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


int main(int argc, char *argv[]){

    auto start = std::chrono::high_resolution_clock::now(); 
    int ret = yyparse();
    auto stop = std::chrono::high_resolution_clock::now();
    if (ret == 0){

        if(argc == 1){

            for(int i = 0; i < ptr; i++){
                cout << decode[i];
            }
            cout << endl;

            cout<<"<ACC>\n";
        }

        auto duration = duration_cast<microseconds>(stop - start); 
        cout << "Solution no. 3 - execution time: " << duration.count() << " us \n";  
    } 
    else cout<<"ERROR: " << ret << "\n";
    return 0;
}
