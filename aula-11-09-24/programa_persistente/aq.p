

PROCEDURE soma:
    // IPDE
    DEF INPUT PARAMETER de-valor-1 AS DECIMAL NO-UNDO
    DEF INPUT PARAMETER de-valor-2 AS DECIMAL NO-UNDO

    // OPDE
    DEF OUTPUT PARAMETER resultado AS DECIMAL NO-UNDO.

    ASSIGN
        resultado = de-valor-1 + de-valor-2.
END. 
    