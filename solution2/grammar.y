%{
    #include <iostream>
    #include <map>
    #include <string>
    #include <stdio.h>
    #include <chrono> 

    #define YYINITDEPTH 200
    #define YYMAXDEPTH 200000000

    using namespace std::chrono; 
    using namespace std;
    int yylex();
    int yyerror(char* message){
        printf("%s\r\n", message);
        return 1;
    }


    #define DECODE_BUFFER_SIZE 1000000
    char decode[DECODE_BUFFER_SIZE];
    int ptr = 0;
    void AddChar(char c){
        if(ptr >= DECODE_BUFFER_SIZE)
        return;
        
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
%token SZOKOZ


%%

E:  S E
    | 
     ;

S:  ROVID BREAK { AddChar('E'); }; 
    | ROVID ROVID BREAK { AddChar('I'); };
    | ROVID ROVID ROVID BREAK { AddChar('S'); };
    | ROVID ROVID ROVID ROVID BREAK { AddChar('H'); };
    | ROVID ROVID ROVID ROVID ROVID BREAK { AddChar('5'); };
    | ROVID ROVID ROVID ROVID HOSSZU BREAK { AddChar('4'); };
    | ROVID ROVID ROVID HOSSZU BREAK { AddChar('V'); };
    | ROVID ROVID ROVID HOSSZU HOSSZU BREAK { AddChar('3'); };
    | ROVID ROVID HOSSZU BREAK { AddChar('U'); };
    | ROVID ROVID HOSSZU ROVID BREAK { AddChar('F'); };
    | ROVID ROVID HOSSZU HOSSZU BREAK { AddChar('2'); };
    | ROVID HOSSZU BREAK { AddChar('A'); }; 
    | ROVID HOSSZU ROVID BREAK { AddChar('R'); }; 
    | ROVID HOSSZU ROVID ROVID BREAK { AddChar('L'); }; 
    | ROVID HOSSZU HOSSZU BREAK { AddChar('W'); }; 
    | ROVID HOSSZU HOSSZU ROVID BREAK { AddChar('P'); }; 
    | ROVID HOSSZU HOSSZU HOSSZU BREAK { AddChar('J'); }; 
    | ROVID HOSSZU HOSSZU HOSSZU HOSSZU BREAK { AddChar('1'); }; 
    | HOSSZU BREAK { AddChar('T'); }; 
    | HOSSZU ROVID BREAK { AddChar('N'); }; 
    | HOSSZU ROVID ROVID BREAK { AddChar('D'); }; 
    | HOSSZU ROVID ROVID ROVID BREAK { AddChar('B'); }; 
    | HOSSZU ROVID ROVID ROVID ROVID BREAK { AddChar('6'); }; 
    | HOSSZU ROVID ROVID HOSSZU BREAK { AddChar('X'); }; 
    | HOSSZU ROVID HOSSZU BREAK { AddChar('K'); }; 
    | HOSSZU ROVID HOSSZU ROVID BREAK { AddChar('C'); }; 
    | HOSSZU ROVID HOSSZU HOSSZU BREAK { AddChar('Y'); };
    | HOSSZU HOSSZU BREAK { AddChar('M'); }; 
    | HOSSZU HOSSZU ROVID BREAK { AddChar('G'); }; 
    | HOSSZU HOSSZU ROVID ROVID BREAK { AddChar('Z'); };  
    | HOSSZU HOSSZU ROVID ROVID ROVID BREAK { AddChar('7'); };
    | HOSSZU HOSSZU ROVID HOSSZU BREAK { AddChar('Q'); };
    | HOSSZU HOSSZU HOSSZU BREAK { AddChar('O'); };  
    | HOSSZU HOSSZU HOSSZU ROVID ROVID BREAK { AddChar('8'); };
    | HOSSZU HOSSZU HOSSZU HOSSZU ROVID BREAK { AddChar('9'); };
    | HOSSZU HOSSZU HOSSZU HOSSZU HOSSZU BREAK { AddChar('0'); };
    | HOSSZU HOSSZU ROVID ROVID HOSSZU HOSSZU BREAK { AddChar(','); };
    | ROVID HOSSZU ROVID HOSSZU ROVID HOSSZU BREAK { AddChar('.'); };
    | SZOKOZ BREAK { AddChar(' '); };



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
        //cout << "Solution no. 2 - execution time: " << duration.count() << " us\n";  
        cout << "2;" << duration.count() << ";";  
    } 
    else cout<<"ERROR: " << ret << "\n";
    return 0;
}
