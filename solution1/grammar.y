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

S:  ROVID R 
    | HOSSZU H11
    | SZOKOZ S1

S1: BREAK { AddChar(' '); };

R:  ROVID R1 
    | HOSSZU H7
    | BREAK { AddChar('E'); };
R1: ROVID R2 
    | HOSSZU H4
    | BREAK  { AddChar('I'); };
R2: ROVID R3 
    | HOSSZU H2
    | BREAK { AddChar('S'); };
R3:  ROVID R4 
    | HOSSZU H1
    | BREAK { AddChar('H'); };
R4: BREAK { AddChar('5'); };

H1: BREAK { AddChar('4'); };

H2: HOSSZU H3 
    | BREAK { AddChar('V'); };

H3: BREAK { AddChar('3'); };


H4: ROVID R5
    | HOSSZU H5 
    | BREAK { AddChar('U'); };

R5: BREAK { AddChar('F'); };

H5: HOSSZU H6 ;

H6: BREAK { AddChar('2'); }; 


H7: ROVID R6
    | HOSSZU H8
    | BREAK { AddChar('A'); };

R6: ROVID R7
    |HOSSZU H20
    | BREAK { AddChar('R'); }; 

R7: BREAK { AddChar('L'); };

H8: ROVID R8
    | HOSSZU H9
    | BREAK { AddChar('W'); };

R8: BREAK { AddChar('P'); };

H9: HOSSZU H10
    | BREAK { AddChar('J'); };

H10: BREAK { AddChar('1'); };




H11: ROVID R9
    | HOSSZU H12
    | BREAK { AddChar('T'); };

R9: ROVID R10
    | HOSSZU H13
    | BREAK { AddChar('N'); };

R10: ROVID R11
    | HOSSZU H14
    | BREAK { AddChar('D'); };

R11: ROVID R12
    | BREAK { AddChar('B'); };

R12: BREAK { AddChar('6'); };

H14: BREAK { AddChar('X'); };

H13: ROVID R13
    | HOSSZU H15
    | BREAK { AddChar('K'); };

R13: BREAK { AddChar('C'); };
H15: BREAK { AddChar('Y'); };


H12: ROVID R14
    | HOSSZU H16
    | BREAK { AddChar('M'); };

R14: ROVID R15
    | HOSSZU H17
    | BREAK { AddChar('G'); };

R15: ROVID R16
    | HOSSZU H22
    | BREAK { AddChar('Z'); };    

R16: BREAK { AddChar('7'); };

H17: BREAK { AddChar('Q'); };


H16: ROVID R17
    | HOSSZU H18
    | BREAK { AddChar('O'); };

R17: ROVID R18
R18: BREAK { AddChar('8'); };

H18: ROVID R19
     | HOSSZU H19

R19: BREAK { AddChar('9'); };
H19: BREAK { AddChar('0'); };


H20: ROVID R21
R21: HOSSZU H21
H21: BREAK { AddChar('.'); };

H22: HOSSZU H23
H23: BREAK { AddChar(','); };

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
