/*
        Exercicio 1: Definir variavel do tipo caractere
*/
DEF VAR caracteres AS CHAR NO-UNDO FORMAT "x(50)".
UPDATE caracteres.

MESSAGE caracteres
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
