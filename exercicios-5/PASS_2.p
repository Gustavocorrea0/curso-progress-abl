/*
    Exercicio 2: Crie um programa que execute um procedimento interno, este deverá retornar a hora corrente.
*/
RUN pro-retornar-valor.

PROCEDURE pro-retornar-valor:
    DEFINE VARIABLE char-hora AS CHAR    NO-UNDO INITIAL NOW.
    char-hora = STRING(TIME, "HH:MM:SS").
    
    MESSAGE "Hora: " char-hora
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
        
END.