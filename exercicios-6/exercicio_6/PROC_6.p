PROCEDURE pro-retornar-nome:
    DEF VAR char-retornar-nome AS CHAR LABEL "Nome" FORMAT "x(40)" NO-UNDO.
    
    UPDATE
          char-retornar-nome.
          
    MESSAGE char-retornar-nome
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.

RUN pro-retornar-nome.
