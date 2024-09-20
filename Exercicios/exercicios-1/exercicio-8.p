DEF VAR dec-valor-1 AS DEC NO-UNDO INITIAL 3.
DEF VAR dec-valor-2 AS DEC NO-UNDO INITIAL 2.
DEF VAR dec-resultado AS DEC NO-UNDO.

dec-resultado = dec-valor-1 / dec-valor-2.

MESSAGE 
        dec-resultado
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
