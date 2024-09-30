DEFINE VARIABLE int-order-num LIKE Order.OrderNum NO-UNDO.
DEFINE VARIABLE dec-total-linha-pedido AS DECIMAL LABEL "Total"    NO-UNDO.

UPDATE
        int-order-num.

FOR FIRST Order WHERE Order.OrderNum = int-order-num NO-LOCK:

    DISPLAY
            Order.OrderNum 
            Order.OrderDate 
            Order.CustNum
            Order.SalesRep.
            
     FOR EACH OrderLine WHERE OrderLine.OrderNum = int-order-num:
        ASSIGN
            dec-total-linha-pedido = (OrderLine.Qty * OrderLine.Price) - OrderLine.Discount.
            
        DISPLAY
            OrderLine.LineNum 
            OrderLine.ItemNum
            OrderLine.Qty 
            OrderLine.Price 
            OrderLine.Discount
            dec-total-linha-pedido WITH WIDTH 90.
     END. 
     
END.
