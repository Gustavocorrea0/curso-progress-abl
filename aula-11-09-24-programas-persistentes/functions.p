DEFINE VARIABLE valor AS DECIMAL LABEL "valor"     NO-UNDO.
DEFINE VARIABLE retorno AS DECIMAL LABEL "retorno"     NO-UNDO.

FUNCTION multiplicar RETURNS DECIMAL (INPUT de-valor AS DECIMAL) FORWARD.

REPEAT:
    UPDATE valor.
    ASSIGN 
        retorno = multiplicar(valor).
    
    DISPLAY retorno.
END.

FUNCTION multiplicar RETURNS DECIMAL (INPUT de-valor AS DECIMAL):
    DEFINE VARIABLE resultado AS DEC   NO-UNDO.
    
    ASSIGN
        resultado = de-valor * 2.
        
    RETURN resultado.
END.