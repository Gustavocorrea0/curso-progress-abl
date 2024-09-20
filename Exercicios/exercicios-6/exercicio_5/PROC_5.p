DEFINE VARIABLE h-programa AS HANDLE      NO-UNDO.

DEFINE VARIABLE int-horas AS INT64 LABEL "Horas" NO-UNDO.
DEFINE VARIABLE dt-hoje AS DATE LABEL "Data Hoje" NO-UNDO.

FUNCTION fun-retornar-horas RETURNS INT64() IN h-programa.
FUNCTION fun-data-hoje RETURNS DATE() IN h-programa.

RUN exercicios-6\exercicio_4\PROC_41.p PERSISTENT SET h-programa.

int-horas = fun-retornar-horas().
dt-hoje = fun-data-hoje().

DISPLAY 
    int-horas
    dt-hoje.

DELETE OBJECT h-programa.
