
%{
    #include <iostream>
    #include <map>
    #include <string>
    #include <stdio.h>
    #include <chrono> 

    using namespace std::chrono; 
    using namespace std;

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


%option noyywrap

SHORT [\.]
LONG [\-]
BREAK [\ ]
SPACE [\/]

DIGITS  [0-9]
ALPHABET [a-zA-Z]

%%
{SHORT}{BREAK}											AddChar('E'); 
{SHORT}{SHORT}{BREAK}									AddChar('I'); 
{SHORT}{SHORT}{SHORT}{BREAK}							AddChar('S'); 
{SHORT}{SHORT}{SHORT}{SHORT}{BREAK}						AddChar('H'); 
{SHORT}{SHORT}{SHORT}{SHORT}{SHORT}{BREAK}				AddChar('5'); 
{SHORT}{SHORT}{SHORT}{SHORT}{LONG}{BREAK}				AddChar('4'); 

{SHORT}{SHORT}{SHORT}{LONG}{BREAK}					    AddChar('V'); 
{SHORT}{SHORT}{SHORT}{LONG}{LONG}{BREAK}			    AddChar('3'); 

{SHORT}{SHORT}{LONG}{BREAK}							    AddChar('U'); 
{SHORT}{SHORT}{LONG}{SHORT}{BREAK}					    AddChar('F'); 
{SHORT}{SHORT}{LONG}{LONG}{LONG}{BREAK}			        AddChar('2'); 


{SHORT}{LONG}{BREAK}								    AddChar('A'); 
{SHORT}{LONG}{SHORT}{BREAK}							    AddChar('R'); 
{SHORT}{LONG}{SHORT}{SHORT}{BREAK}					    AddChar('L'); 
{SHORT}{LONG}{LONG}{BREAK}							    AddChar('W'); 
{SHORT}{LONG}{LONG}{SHORT}{BREAK}					    AddChar('P'); 
{SHORT}{LONG}{LONG}{LONG}{BREAK}					    AddChar('J'); 
{SHORT}{LONG}{LONG}{LONG}{LONG}{BREAK}			        AddChar('1'); 


{LONG}{BREAK}											AddChar('T'); 
{LONG}{SHORT}{BREAK}									AddChar('N'); 
{LONG}{SHORT}{SHORT}{BREAK}							    AddChar('D'); 
{LONG}{SHORT}{SHORT}{SHORT}{BREAK}					    AddChar('B'); 
{LONG}{SHORT}{SHORT}{SHORT}{SHORT}{BREAK}				AddChar('6'); 
{LONG}{SHORT}{SHORT}{LONG}{BREAK}					    AddChar('X'); 
{LONG}{SHORT}{LONG}{BREAK}							    AddChar('K'); 
{LONG}{SHORT}{LONG}{SHORT}{BREAK}					    AddChar('C'); 
{LONG}{SHORT}{LONG}{LONG}{BREAK}					    AddChar('Y'); 

{LONG}{LONG}{BREAK}									    AddChar('M'); 
{LONG}{LONG}{SHORT}{BREAK}							    AddChar('G'); 
{LONG}{LONG}{SHORT}{SHORT}{BREAK}					    AddChar('Z'); 
{LONG}{LONG}{SHORT}{SHORT}{SHORT}{BREAK}			    AddChar('7'); 
{LONG}{LONG}{SHORT}{LONG}{BREAK}					    AddChar('Q'); 
{LONG}{LONG}{LONG}{BREAK}							    AddChar('O'); 
{LONG}{LONG}{LONG}{LONG}{LONG}{BREAK}			        AddChar('0'); 
{LONG}{LONG}{LONG}{LONG}{SHORT}{BREAK}			        AddChar('9'); 


{SPACE}{BREAK}											AddChar(' '); 

{LONG}{LONG}{SHORT}{SHORT}{LONG}{LONG}{BREAK}           AddChar(','); 
{SHORT}{LONG}{SHORT}{LONG}{SHORT}{LONG}{BREAK}          AddChar('.'); 

\n                              return '\0';

{ALPHABET}({ALPHABET}|{DIGITS})*    					;

%% 


int main(int argc, char *argv[]){

    auto start = std::chrono::high_resolution_clock::now(); 
    int ret = yylex();
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
        //cout << "Solution no. 3 - execution time: " << duration.count() << " us \n"; 
        cout << "3;" << duration.count() << ";";   
    } 
    else cout<<"ERROR: " << ret << "\n";
    return 0;
}

