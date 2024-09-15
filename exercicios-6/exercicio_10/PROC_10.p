FUNCTION fun-retornar-valor RETURN DEC(INPUT dec-valor-recebido AS DEC):
    DEFINE VARIABLE dec-valor-percentual AS DECIMAL     NO-UNDO INITIAL 13.85.
    DEFINE VARIABLE dec-valor-corrigido AS DECIMAL     NO-UNDO.
    
    dec-valor-corrigido = (dec-valor-recebido * dec-valor-percentual) / 100.
    
    RETURN dec-valor-corrigido. 
END.

DEFINE VARIABLE dec-valor-usuario AS DECIMAL LABEL "Valor"     NO-UNDO.
DEFINE VARIABLE dec-percentual AS DECIMAL NO-UNDO.

UPDATE
    dec-valor-usuario.

dec-percentual = fun-retornar-valor(dec-valor-usuario).

MESSAGE dec-percentual
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
