DEFINE VARIABLE int-codigo-cliente AS INT64 LABEL "Codigo do Cliente"      NO-UNDO.

UPDATE 
       int-codigo-cliente.
       
FOR FIRST Customer WHERE Customer.CustNum = int-codigo-cliente:
    DISPLAY 
        Customer.CustNum
        Customer.Name
        Customer.Address 
        Customer.SalesRep.
END.
