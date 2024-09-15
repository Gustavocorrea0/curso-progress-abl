FUNCTION fun-retornar-horas RETURN INT64():
    DEFINE VARIABLE horas AS INT64 LABEL "Horas" NO-UNDO.
    horas = TIME.
    horas = horas / 3600.
    RETURN horas.
END.

FUNCTION fun-data-hoje RETURN DATE():
    RETURN TODAY. 
END.
