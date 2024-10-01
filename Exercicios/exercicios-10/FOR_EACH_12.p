DEFINE VARIABLE char-codigo-representante LIKE SalesRep.SalesRep   NO-UNDO.

REPEAT:
    UPDATE
        char-codigo-representante.

    FOR FIRST SalesRep WHERE SalesRep.SalesRep = char-codigo-representante NO-LOCK:
        DISPLAY 
            SalesRep.RepName
            SalesRep.SalesRep.
            
        FOR EACH Order, Customer WHERE Order.SalesRep = SalesRep.SalesRep AND Customer.CustNum = Order.CustNum NO-LOCK:
                DISPLAY
                    Order.OrderNum 
                    Order.OrderDate
                    Order.CustNum
                    Customer.NAME WITH WIDTH 100.
        END.
    END.
END.
