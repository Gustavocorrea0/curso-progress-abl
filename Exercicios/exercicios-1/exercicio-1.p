DEF VAR int-valor-1 AS INT64 NO-UNDO.
DEF VAR int-valor-2 AS INT64 NO-UNDO.
DEF VAR int-valor-3 AS INT64 NO-UNDO.

UPDATE int-valor-1 LABEL "Valor 1: ".
UPDATE int-valor-2 LABEL "Valor 2: ".

ASSIGN int-valor-3 = int-valor-1 + int-valor-2.

MESSAGE
    "Valor 1: " int-valor-1 SKIP
    "Valor 2: " int-valor-2 SKIP
    "Total:" int-valor-3
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
    
