DEFINE VARIABLE int-codigo-cliente AS INT64 LABEL "Codigo do Cliente"      NO-UNDO.
DEFINE VARIABLE int-order-order-num AS INT64       NO-UNDO.
REPEAT:

    UPDATE 
           int-codigo-cliente.
           
    FOR FIRST Customer WHERE Customer.CustNum = int-codigo-cliente:
        DISPLAY 
           Customer.CustNum
           Customer.NAME
           Customer.CreditLimit.
       
        FOR EACH Order WHERE Order.CustNum = int-codigo-cliente NO-LOCK:
            UPDATE
                  int-order-order-num = Order.OrderNum.
            DISPLAY 
                Order.OrderNum
                Order.OrderDate
                Order.OrderStatus
                Order.ShipDate.
                
            FOR FIRST OrderLine WHERE OrderLine.OrderNum = Order.OrderNum NO-LOCK:
            DISPLAY
                   OrderLine.LineNum 
                   OrderLine.ItemNum 
                   OrderLine.Qty
                   OrderLine.Price.
            END.
        END.

    END.
    
END.
