/*
    1 - Crie uma tabela temporaria copia da tabela customer, copie os
    dados, para esta tabela a exibindo com FOR-EACH.
*/

DEF TEMP-TABLE tt-customer LIKE customer.

FOR EACH customer NO-LOCK:
    CREATE tt-customer.
    BUFFER-COPY customer TO tt-customer.
END.

PAUSE.

FOR EACH tt-customer:
    DISPLAY 
        tt-customer.Address
        tt-customer.Address2
        tt-customer.Balance
        tt-customer.City
        tt-customer.Contact
        tt-customer.Country
        tt-customer.CustNum 
        tt-customer.Name 
        tt-customer.Phone WITH WIDTH 200. 
END.

