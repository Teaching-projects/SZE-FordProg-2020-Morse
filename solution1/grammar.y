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

%token BREAK
%token SHORT
%token LONG
%token SPACE


%%

msg : character  msg
    | 
     ;

character:    SHORT s 
            | LONG l
            | SPACE sp

sp:       BREAK { AddChar(' '); };

s:        SHORT ss
        | LONG sl
        | BREAK { AddChar('E'); };

ss:       SHORT sss 
        | LONG ssl
        | BREAK  { AddChar('I'); };

sss:      SHORT ssss 
        | LONG sssl
        | BREAK { AddChar('S'); };

ssss:     SHORT sssss 
        | LONG ssssl
        | BREAK { AddChar('H'); };

sssss:    BREAK { AddChar('5'); };

ssssl:    BREAK { AddChar('4'); };

sssl:     LONG sssll 
        | BREAK { AddChar('V'); };

sssll:    BREAK { AddChar('3'); };


ssl:      SHORT ssls
        | LONG ssll 
        | BREAK { AddChar('U'); };

ssls:     BREAK { AddChar('F'); };

ssll:     LONG sslll ;

sslll:    BREAK { AddChar('2'); }; 


sl:       SHORT sls
        | LONG sll
        | BREAK { AddChar('A'); };

sls:      SHORT slss
        | LONG slsl
        | BREAK { AddChar('R'); }; 

slss:     BREAK { AddChar('L'); };

sll:      SHORT slls
        | LONG slll
        | BREAK { AddChar('W'); };

slls:     BREAK { AddChar('P'); };

slll:     LONG sllll
        | BREAK { AddChar('J'); };

sllll:    BREAK { AddChar('1'); };




l:        SHORT ls
        | LONG ll
        | BREAK { AddChar('T'); };

ls:       SHORT lss
        | LONG lsl
        | BREAK { AddChar('N'); };

lss:      SHORT lsss
        | LONG lssl
        | BREAK { AddChar('D'); };

lsss:     SHORT lssss
        | BREAK { AddChar('B'); };

lssss:    BREAK { AddChar('6'); };

lssl:     BREAK { AddChar('X'); };

lsl:      SHORT lsls
        | LONG lsll
        | BREAK { AddChar('K'); };

lsls:     BREAK { AddChar('C'); };
lsll:     BREAK { AddChar('Y'); };


ll:       SHORT lls
        | LONG lll
        | BREAK { AddChar('M'); };

lls:      SHORT llss
        | LONG llsl
        | BREAK { AddChar('G'); };

llss:     SHORT llsss
        | LONG llssl
        | BREAK { AddChar('Z'); };    

llsss:    BREAK { AddChar('7'); };

llsl:     BREAK { AddChar('Q'); };


lll:      SHORT llls
        | LONG llll
        | BREAK { AddChar('O'); };

llls:     SHORT lllss
lllss:    BREAK { AddChar('8'); };

llll:     SHORT lllls
        | LONG lllll

lllls:    BREAK { AddChar('9'); };
lllll:    BREAK { AddChar('0'); };


slsl:     SHORT slsls
slsls:    LONG slslsl
slslsl:   BREAK { AddChar('.'); };

llssl:    LONG llssll
llssll:   BREAK { AddChar(','); };

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
        cout << "Solution no. 1 - execution time: " << duration.count() << " us\n";  
    } 
    else cout<<"ERROR: " << ret << "\n";
    return 0;
}
