DEFINE VARIABLE data-pedido-1 LIKE Order.OrderDate LABEL "Data Inicial" NO-UNDO.
DEFINE VARIABLE data-pedido-2 LIKE Order.OrderDate LABEL "Data Final" NO-UNDO.

REPEAT:
    UPDATE 
        data-pedido-1
        data-pedido-2.
        
    FOR EACH Order WHERE 
                    Order.OrderDate > data-pedido-1 AND
                    Order.OrderDate < data-pedido-2 NO-LOCK:
        DISPLAY
               Order.OrderDate 
               Order.OrderNum
               Order.OrderStatus
               Order.CustNum.
    END.
END.
