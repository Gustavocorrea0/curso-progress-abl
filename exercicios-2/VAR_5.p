/*
    Exercicio 5: definir uma variavel caractere, decimal, data e inteiro com vetor de 5
    posições, utilize a opção 'extent'.
*/

// EXTENT = Quantidade de posicoes

DEF VAR char-valor AS CHAR EXTENT 5 INITIAL "OK".
DEF VAR dec-valor AS DEC EXTENT 5 INITIAL 12.5.
DEF VAR date-valor AS DATE EXTENT 5 INITIAL "10/10/10".
DEF VAR int-valor AS INT64 EXTENT 5 INITIAL 23. 

DISPLAY 
        char-valor SKIP
        dec-valor SKIP
        date-valor SKIP
        int-valor.