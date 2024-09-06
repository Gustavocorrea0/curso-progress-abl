/*
    9 - Com uma variavel inteira e utilizando IF mostre se o valor é maior que 1, ou 2, ou 3,
    utilize IF, THEN e ELSE
*/

DEFINE VARIABLE int-valor-1 AS INT64 LABEL "Valor 1"       NO-UNDO.
UPDATE
        int-valor-1.

IF int-valor-1 > 3 THEN
    MESSAGE "Valor maior que 3"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
IF int-valor-1 > 2 THEN
    MESSAGE "Valor maior que 2"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.    
IF int-valor-1 >= 1 THEN
    MESSAGE "Valor maior ou igual 1"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
ELSE
    MESSAGE "Valor menor que 1"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
