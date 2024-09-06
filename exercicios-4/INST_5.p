/*
    5 - Verifique se a primeira variavel do tipo inteiro é maior ou igual que a segunda variavel do tipo decimal
*/

DEFINE VARIABLE int-valor-1 AS INT64 LABEL "Valor 1 - Inteiro"     NO-UNDO.
DEFINE VARIABLE dec-valor-1 AS DECIMAL LABEL "Valor 2 - Decimal"     NO-UNDO.

UPDATE int-valor-1
       dec-valor-1.

IF dec(int-valor-1) >= dec-valor-1 THEN
    MESSAGE "O primeiro valor é maior ou igual ao segundo"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
IF dec(int-valor-1) < dec-valor-1 THEN
    MESSAGE "O segundo valor é maior que o primeiro"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
