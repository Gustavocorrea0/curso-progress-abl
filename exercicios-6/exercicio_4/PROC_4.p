DEFINE VARIABLE h-programa AS HANDLE      NO-UNDO.

FUNCTION fun-retornar-horas RETURNS INT64() IN h-programa.
FUNCTION fun-data-hoje RETURNS DATE() IN h-programa.

RUN exercicios-6\exercicio_4\PROC_41.p PERSISTENT SET h-programa.

DISPLAY 
       fun-retornar-horas()
       fun-data-hoje().

DELETE OBJECT h-programa.
