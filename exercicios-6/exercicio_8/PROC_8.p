DEFINE VARIABLE char-opcao AS CHARACTER LABEL "Opção escolhida"   NO-UNDO.

UPDATE
    char-opcao.
    
IF char-opcao = "1" THEN
    RUN pro-um.
ELSE
    RUN pro-dois.
    

PROCEDURE pro-um:
    DISPLAY "Pro 1".
END.
    
PROCEDURE pro-dois:
    DISPLAY "Pro 2".
END.
