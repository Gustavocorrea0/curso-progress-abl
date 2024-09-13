/* REVER */
PROCEDURE pro-retornar-nome:
    DEF RETURN PARAMETER char-retornar-nome AS CHAR.
    
    UPDATE
          char-retornar-nome.
          
    MESSAGE char-retornar-nome
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.

DEFINE VARIABLE char-nome AS CHARACTER   NO-UNDO.
//RUN pro-retornar-nome(OUTPUT char-nome).
