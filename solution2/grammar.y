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
