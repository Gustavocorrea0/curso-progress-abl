DEF VAR dec-valor-1 AS DEC NO-UNDO.
DEF VAR dec-valor-2 AS DEC NO-UNDO.
DEF VAR dec-valor-3 AS DEC NO-UNDO.

UPDATE dec-valor-1 LABEL "Valor 1: ".
UPDATE dec-valor-2 LABEL "Valor 2: ".

dec-valor-3 = dec-valor-1 + dec-valor-2.

MESSAGE 
    "Valor 1: " dec-valor-1 SKIP
    "Valor 2: " dec-valor-2 SKIP
    "Resultado:" dec-valor-3
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
