DEFINE VARIABLE char-representante LIKE SalesRep.SalesRep  NO-UNDO.

REPEAT:

    UPDATE 
        char-representante.

        FOR FIRST SalesRep WHERE SalesRep.SalesRep = char-representante NO-LOCK:
                DISPLAY
                       SalesRep.RepName
                       SalesRep.SalesRep.
                       
            FOR EACH Customer WHERE Customer.SalesRep = SalesRep.SalesRep NO-LOCK:
                DISPLAY
                        Customer.CustNum
                        Customer.Name
                        Customer.CreditLimit
                        Customer.Contact 
                        Customer.Phone WITH WIDTH 120.
            END.
        END.
    
END.
