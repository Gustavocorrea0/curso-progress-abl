/*
    3 - USANDO VARIAVEIS DO TIPO DECIMAL MOSTRE SE A PRIMEIRA VARIAVEL É MAIOR QUE A SEGUNDA
*/
DEFINE VARIABLE dec-valor-1 AS DECIMAL LABEL "Valor 1"     NO-UNDO.
DEFINE VARIABLE dec-valor-2 AS DECIMAL LABEL "Valor 2L"    NO-UNDO.

UPDATE
        dec-valor-1
        dec-valor-2.

IF dec-valor-1 > dec-valor-2 THEN
    MESSAGE "O primeiro valor é maior"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
IF dec-valor-1 < dec-valor-2 THEN
    MESSAGE "O segundo valor é maior"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
IF dec-valor-1 = dec-valor-2 THEN
    MESSAGE "Ambos os valores são iguais"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
        
