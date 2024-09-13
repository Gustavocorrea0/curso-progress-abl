/*
    1 - Criar programa que execute procedimento externo, este devera mostrar a data
    de hoje(instrutor)
*/

DEFINE VARIABLE h-programa AS HANDLE      NO-UNDO.

// PASSAR MESMO NOME DA FUNCAO PRESENTE NO PERSISTEN
FUNCTION fun-data-hoje RETURNS DATE() IN h-programa.

RUN exercicios-6\exercicio_1\PROC_1_retornar_data.p PERSISTENT SET h-programa.

DEFINE VARIABLE char-data AS CHARACTER   NO-UNDO.

ASSIGN
    char-data = STRING(fun-data-hoje()).

DISPLAY 
    char-data.
