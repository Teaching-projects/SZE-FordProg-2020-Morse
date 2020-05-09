
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
The script will generate the input file 5000 times and print it into the test_tmp.txt. Basically the test.txt is repeated 5000 times and execeuted in each loop. 

An example for the result:
```
0;1;1252;2;1426;3;470;
500;1;722174;2;515457;3;151626;
1000;1;1509374;2;957076;3;307054;
1500;1;1907713;2;1435328;3;473716;
2000;1;2339520;2;1743884;3;475277;
2500;1;2854142;2;2008632;3;595838;
3000;1;3459955;2;2417744;3;745122;
3500;1;4002713;2;2918616;3;837483;
4000;1;4624328;2;3186078;3;956140;
4500;1;5387813;2;3599979;3;1071981;
5000;1;5705567;2;3955593;3;1184437;
```

# Solution 1

The grammar is made to decode the morse code. Snippet from the grammar:
```
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
```
# Solution 2
Similar to solution 1, but the grammar is different. The terminals put after one another like this:
```
msg:  character msg
    | 
     ;

character:  SHORT BREAK { AddChar('E'); }; 
    | SHORT SHORT BREAK { AddChar('I'); };
    | SHORT SHORT SHORT BREAK { AddChar('S'); };
    | SHORT SHORT SHORT SHORT BREAK { AddChar('H'); };
    | SHORT SHORT SHORT SHORT SHORT BREAK { AddChar('5'); };
    | SHORT SHORT SHORT SHORT LONG BREAK { AddChar('4'); };
    | SHORT SHORT SHORT LONG BREAK { AddChar('V'); };
    | SHORT SHORT SHORT LONG LONG BREAK { AddChar('3'); };
    | SHORT SHORT LONG BREAK { AddChar('U'); };
    | SHORT SHORT LONG SHORT BREAK { AddChar('F'); };
```

# Solution 3
Different from the solutions above. The morse code is decoded by the lexer. 
```
SHORT [\.]
LONG [\-]
BREAK [\ ]
SPACE [\/]

DIGITS  [0-9]
ALPHABET [a-zA-Z]

%%
{SHORT}{BREAK}                                          AddChar('E'); 
{SHORT}{SHORT}{BREAK}                                   AddChar('I'); 
{SHORT}{SHORT}{SHORT}{BREAK}                            AddChar('S'); 
{SHORT}{SHORT}{SHORT}{SHORT}{BREAK}                     AddChar('H'); 
{SHORT}{SHORT}{SHORT}{SHORT}{SHORT}{BREAK}              AddChar('5'); 
{SHORT}{SHORT}{SHORT}{SHORT}{LONG}{BREAK}               AddChar('4'); 
```

# Who is the winner?
During several executions the solution 3 seems the winner.  The same text was reproduced 5000 times. The following table indicates the results:

|id| 1 | 2 | 3 |
|--|---|---|---|
| 0| 1252 us | 1426 us | 470 us
| 500| 722174 us | 515457 us | 151626 us
| 1000| 1509374 us | 957076 us | 307054 us
| 1500| 1907713 us | 1435328 us | 473716 us
| 2000| 2339520 us | 1743884 us | 475277 us
| 2500| 2854142 us | 2008632 us | 595838 us
| 3000| 3459955 us | 2417744 us | 745122 us
| 3500| 4002713 us | 2918616 us | 837483 us
| 4000| 4624328 us | 3186078 us | 956140 us
| 4500| 5387813 us | 3599979 us | 1071981 us
| 5000| 5705567 us | 3955593 us | 1184437 us

    