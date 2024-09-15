/* Exemplo de buffer com passagem de parametros */

PROCEDURE fun-receber-buffer:
    DEFINE PARAM BUFFER buf-customer FOR customer.
    
    DISPLAY 
        buf-customer.custnum
        buf-customer.NAME
        buf-customer.address WITH 1 COL.
END.

DEF VAR int-codigo AS INT64 NO-UNDO.

REPEAT:
    UPDATE int-codigo.
    
    FIND FIRST customer NO-LOCK WHERE customer.custnum = int-codigo NO-ERROR.
    
    IF AVAIL customer THEN DO:
        DISPLAY customer.custnum customer.NAME WITH TITLE "cliente".
        
        RUN fun-receber-buffer ( BUFFER customer ).
    END.
END.
