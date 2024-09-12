/*
    2 - Criar um programa que execute procedimento interno, este devera  mostrar a hora corrente. 
*/

FUNCTION fun-retornar-horas RETURN INT64():
    DEFINE VARIABLE horas AS INT64   NO-UNDO.
    horas = TIME.
    horas = horas / 3600.
    RETURN horas.
END.

display
    fun-retornar-horas().
