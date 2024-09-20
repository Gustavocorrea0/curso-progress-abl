DEFINE VARIABLE h-programa AS HANDLE      NO-UNDO.

DEFINE VARIABLE dec-valor-usuario AS DECIMAL LABEL "Valor"     NO-UNDO.
DEFINE VARIABLE dec-percentual AS DECIMAL LABEL "Percentual"     NO-UNDO.

FUNCTION fun-retornar-valor RETURNS DEC(dec-valor-recebido AS DEC) IN h-programa.

RUN exercicios-6\exercicio_12\PROC_10.p PERSISTENT SET h-programa.
UPDATE
      dec-valor-usuario.
      
dec-percentual = fun-retornar-valor(dec-valor-usuario).

MESSAGE dec-percentual
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
    
DELETE OBJECT h-programa.
