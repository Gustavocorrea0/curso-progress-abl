DEFINE VARIABLE int-order-num LIKE Order.OrderNum   NO-UNDO.

REPEAT:

    UPDATE int-order-num.

    FOR FIRST Order WHERE Order.OrderNum = int-order-num:
        DISPLAY
            Order.OrderNum
            Order.OrderDate 
            Order.CustNum
            Order.SalesRep.
    END.

END.
