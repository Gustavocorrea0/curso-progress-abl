/*
    7 - Verifique se a variavel nome completo inicia por "A", utilize o operador BEGINS
*/

DEFINE VARIABLE char-nome-completo AS CHARACTER LABEL "Nome completo" FORMAT "x(30)"   NO-UNDO.

UPDATE 
    char-nome-completo.
    
IF char-nome-completo BEGINS "a" THEN
    MESSAGE "A palavra come�a com A"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
