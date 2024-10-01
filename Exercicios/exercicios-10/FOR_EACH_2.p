DEFINE VARIABLE int-codigo-cliente AS INT64 LABEL "Codigo do Cliente"      NO-UNDO.

UPDATE 
       int-codigo-cliente.
       
FOR FIRST Customer WHERE Customer.CustNum = int-codigo-cliente:
    DISPLAY 
       Customer.CustNum
       Customer.NAME
       Customer.CreditLimit.
   
    FOR EACH Order WHERE Order.CustNum = int-codigo-cliente:
        DISPLAY 
            Order.OrderNum
            Order.OrderDate
            Order.OrderStatus
            Order.ShipDate.
    END.
END.
