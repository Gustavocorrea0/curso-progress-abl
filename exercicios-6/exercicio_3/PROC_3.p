FUNCTION fun-data-de-hoje-mais-30 RETURN DATE():
    DEFINE VARIABLE data-hoje AS DATE   NO-UNDO INITIAL TODAY.
    RETURN data-hoje + 30.
END.

DISPLAY fun-data-de-hoje().
