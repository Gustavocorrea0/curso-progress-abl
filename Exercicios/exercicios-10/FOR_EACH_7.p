DEFINE VARIABLE int-order-num LIKE Order.OrderNum   NO-UNDO.

DEFINE VARIABLE int-cod-customer AS INT64       NO-UNDO.


UPDATE 
    int-order-num.

FOR FIRST Order WHERE Order.OrderNum = int-order-num NO-LOCK:
    DISPLAY
            Order.OrderNum 
            Order.OrderDate 
            Order.CustNum
            Order.SalesRep.
            
    FOR EACH OrderLine WHERE OrderLine.OrderNum = int-order-num NO-LOCK:
    DISPLAY
             OrderLine.LineNum 
             OrderLine.ItemNum
             OrderLine.Qty
             OrderLine.Price
             OrderLine.Discount.
    END.
END.
    

