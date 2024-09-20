/*
    Exercicio 1: Crie um programa que execute procedimento externo, este devera retornar a data de hoje
*/
DEFINE VARIABLE c-data-hoje AS CHARACTER NO-UNDO.
RUN exercicios-5/PASS_1_EXTERNA.p(OUTPUT c-data-hoje).
DISPLAY c-data-hoje LABEL "Data de hoje".
