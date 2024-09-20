DEF VAR int-raiz-2 AS INT NO-UNDO INITIAL 2.
DEF VAR int-raiz-3 AS INT NO-UNDO INITIAL 3.
DEF VAR dec-soma-raiz AS DEC NO-UNDO.

dec-soma-raiz = SQRT(int-raiz-2) + SQRT(int-raiz-3).

MESSAGE 
        "Valor 1:" SQRT(int-raiz-2) SKIP
        "Valor 2:" SQRT(int-raiz-3) SKIP
        "Soma das raizes:" dec-soma-raiz
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.



