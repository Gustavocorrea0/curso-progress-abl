DEFINE VARIABLE char-opcao AS CHARACTER LABEL "Op��o escolhida" FORMAT "x(20)"  NO-UNDO.

UPDATE
    char-opcao.
    
IF char-opcao = "1" THEN
    RUN pro-um.
ELSE
    RUN pro-dois.
    

PROCEDURE pro-um:
    MESSAGE "Pro 1 executada"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
    
PROCEDURE pro-dois:
    MESSAGE "Pro 2 executada"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
