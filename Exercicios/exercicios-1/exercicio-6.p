DEF VAR int-raiz-2 AS INT NO-UNDO LABEL "Valor 1" INITIAL 2.
DEF VAR int-raiz-3 AS INT NO-UNDO LABEL "Valor 2" INITIAL 3.
DEF VAR dec-soma-raiz AS DEC NO-UNDO LABEL "Soma de raiz" FORMAT '9.99999'.

dec-soma-raiz = SQRT(int-raiz-2) + SQRT(int-raiz-3).
       
DISPLAY 
        "Valor 1:" SQRT(int-raiz-2) SKIP
        "Valor 2:" SQRT(int-raiz-3) SKIP
        "Soma das raizes:" dec-soma-raiz SKIP
        "Soma corrigida:" ROUND(dec-soma-raiz, 2).
