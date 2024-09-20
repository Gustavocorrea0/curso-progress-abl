/*
    TEMP-TABLE COM BUFFER-COPY
*/

DEF TEMP-TABLE tt-customer LIKE customer
    FIELD i-codigo AS INT.
    
/* copiar todos os dados da tabela customer para a temp-table */
FOR EACH customer NO-LOCK:
    CREATE tt-customer.
    BUFFER-COPY customer TO tt-customer ASSIGN tt-customer.i-codigo = customer.custnum.
END.

PAUSE.

FOR EACH tt-customer:
    DISPLAY tt-customer.custnum tt-customer.NAME tt-customer.address tt-customer.i-codigo.
END.
