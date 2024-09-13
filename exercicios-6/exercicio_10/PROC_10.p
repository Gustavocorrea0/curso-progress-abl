DEFINE VARIABLE h-programa AS HANDLE      NO-UNDO.
DEFINE VARIABLE dec-valor-usuario AS DECIMAL LABEL "Valor"     NO-UNDO.
DEFINE VARIABLE dec-valor-corrigido AS DECIMAL     NO-UNDO.

FUNCTION fun-retornar-valor RETURNS DEC(INPUT dec-valor-recebido AS DEC) IN h-programa.

RUN exercicios-6\exercicio_10\PROC_9.p PERSISTENT SET h-programa.

UPDATE 
    dec-valor-usuario.

dec-valor-corrigido = fun-retornar-valor(dec-valor-usuario).    
    
MESSAGE dec-valor-corrigido
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
