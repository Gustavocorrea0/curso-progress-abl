/*
    Exercicio 1: Crie um programa que execute procedimento externo, este devera retornar a data de hoje
*/

PROCEDURE pro-data-e-hora EXTERNAL "/usr/lib/libc.so.1":
    DEF OUTPUT PARAMETER dt-data-hora AS CHAR NO-UNDO INITIAL NOW.
END.

DEF VAR dt-data-hora-pro AS CHAR LABEL "Data e Hora" NO-UNDO.

RUN pro-data-e-hora(OUTPUT dt-data-hora-pro).

DISPLAY dt-data-hora-pro.
