# Morse code decoder with Flex and Bison

This repo contains 3 kinds of solutions to decode Morse code with Flex and Bison. Each solution is identified as 'solution1, ... '. The solutions also measures execution times in microseconds which helps to determine which are the best for the purpose.

The 'text.txt' contains a predefined morse code which are the input of the solutions. The 'original_text.txt' is the source of the 'text.txt'.

Running the solutions with printing the decoded text:
```sh
$ sh run.sh
```

Running the solutions printing only the execution times:
```sh
$ sh run.sh -n
```

Applying any kind of switch will result printing only the execution times.
It is recommended to run several times to get a better estimation which solution is the best.

# Solution 1

The grammar is made to decode the morse code. Snippet from the grammar:
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

# Solution 2
Similar to solution 1, but the grammar is different. The terminals put after one another like this:
E:  S E
    | 
     ;

S:  ROVID BREAK { AddChar('E'); }; 
    | ROVID ROVID BREAK { AddChar('I'); };
    | ROVID ROVID ROVID BREAK { AddChar('S'); };
    | ROVID ROVID ROVID ROVID BREAK { AddChar('H'); };
    | ROVID ROVID ROVID ROVID ROVID BREAK { AddChar('5'); };

# Solution 3
Different from the solutions above. The morse code is decoded by the lexer. 
ROVID [\.]
HOSSZU [\-]
BREAK [\ ]
SZOKOZ [\/]

DIGITS  [0-9]
ALPHABET [a-zA-Z]

%%
{ROVID}{BREAK}											yylval.name='E'; return SYMBOL;
{ROVID}{ROVID}{BREAK}									yylval.name='I'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{BREAK}							yylval.name='S'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{ROVID}{BREAK}						yylval.name='H'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{ROVID}{ROVID}{BREAK}				yylval.name='5'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{ROVID}{HOSSZU}{BREAK}				yylval.name='4'; return SYMBOL;

{ROVID}{ROVID}{ROVID}{HOSSZU}{BREAK}					yylval.name='V'; return SYMBOL;
{ROVID}{ROVID}{ROVID}{HOSSZU}{HOSSZU}{BREAK}			yylval.name='3'; return SYMBOL;

# Who is the winner?
During several executions the solution 3 seems the winner. The executions takes 800-1100 us in average.
##### Loop #1:
Solution no. 1 - execution time: 1139
Solution no. 2 - execution time: 1501
Solution no. 3 - execution time: 739

##### Loop #2:
Solution no. 1 - execution time: 2126
Solution no. 2 - execution time: 2390
Solution no. 3 - execution time: 1038
##### Loop #3:
Solution no. 1 - execution time: 2071
Solution no. 2 - execution time: 1776
Solution no. 3 - execution time: 1019
##### Loop #4:
Solution no. 1 - execution time: 1232
Solution no. 2 - execution time: 993
Solution no. 3 - execution time: 678
##### Loop #5:
Solution no. 1 - execution time: 1124
Solution no. 2 - execution time: 1476
Solution no. 3 - execution time: 982
##### Loop #6:
Solution no. 1 - execution time: 1160
Solution no. 2 - execution time: 1011
Solution no. 3 - execution time: 743
##### Loop #7:
Solution no. 1 - execution time: 1202
Solution no. 2 - execution time: 980
Solution no. 3 - execution time: 666
##### Loop #8:
Solution no. 1 - execution time: 1146
Solution no. 2 - execution time: 982
Solution no. 3 - execution time: 724
    