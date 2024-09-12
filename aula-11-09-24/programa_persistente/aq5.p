/*executar aq4*/
DEFINE VARIABLE programa AS HANDLE      NO-UNDO.
DEFINE VARIABLE codigo-cliente AS INT64       NO-UNDO.
DEFINE VARIABLE nome-cliente AS CHARACTER   NO-UNDO.

RUN programa-persistente/aq4.p
    PERSISTENT
    SET programa.

UPDATE codigo-cliente.
    
RUN get-nome-cliente IN programa (INPUT codigo-cliente,
                                  OUTPUT nome-cliente).
                                  
DISPLAY nome-cliente.

DELETE OBJECT programa.
