DEFINE VARIABLE programa AS HANDLE      NO-UNDO.

DEFINE VARIABLE valor-1 AS DECIMAL     NO-UNDO.
DEFINE VARIABLE valor-2 AS DECIMAL     NO-UNDO.
DEFINE VARIABLE resultado AS DECIMAL     NO-UNDO.

//
RUN <nome-pasta>/aq1.p PERSISTENT SET programa.

// EXECUTAR A PROCEDURE DO PROGRAMA aq1.p 
RUN somar IN programa (INPUT valor-1,
                       INPUT valor-2,
                       OUTPUT resultado).

DISPLAY resultado.

// REMOVER DA MEMORIA
DELETE OBJECT programa.
