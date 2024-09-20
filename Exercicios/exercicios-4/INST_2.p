/*
    2 - Repita o primeiro exercicio, mas usando o operador GT(>)
*/
DEFINE VARIABLE int-valor-1 AS INT64 LABEL "Valor 1"      NO-UNDO.
DEFINE VARIABLE int-valor-2 AS INT64 LABEL "Valor 2"      NO-UNDO.

UPDATE
        int-valor-1
        int-valor-2.

IF int-valor-1 GT int-valor-2 THEN
    MESSAGE "O primeiro valor é maior"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
IF int-valor-2 GT int-valor-1 THEN
    MESSAGE "O segundo valor é maior"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
IF int-valor-1 = int-valor-2 THEN
    MESSAGE "Ambos os valores são iguais"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
