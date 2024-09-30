DEFINE VARIABLE int-order-num LIKE Order.OrderNum       NO-UNDO.

REPEAT:

UPDATE int-order-num.


    FOR FIRST Order WHERE Order.OrderNum = int-order-num NO-LOCK:
        FOR FIRST Customer WHERE Customer.CustNum = Order.CustNum NO-LOCK:
            FOR FIRST SalesRep WHERE SalesRep.SalesRep = Order.SalesRep NO-LOCK:
                DISPLAY
                    Order.OrderNum
                    Order.CustNum
                    Customer.Name
                    Order.OrderDate
                    Order.SalesRep
                    SalesRep.repname 
                    WITH WIDTH 110.
            END.
        END.
    END.
END.
