DEFINE VARIABLE h-programa AS HANDLE      NO-UNDO.

FUNCTION fun-data-hoje RETURNS DATE() IN h-programa.

RUN exercicios-6\exercicio_1\PROC_1_retornar_data.p PERSISTENT SET h-programa.

DEFINE VARIABLE char-data AS CHARACTER LABEL " Data de Hoje"   NO-UNDO.

ASSIGN
    char-data = STRING(fun-data-hoje()).

DISPLAY 
    char-data.
