DEFINE VARIABLE dec-total AS DECIMAL LABEL "Total"     NO-UNDO.


FOR EACH Order NO-LOCK:
    ASSIGN 
        dec-total = 0.
        
    FOR FIRST Customer WHERE Customer.CustNum = Order.CustNum NO-LOCK:
    DISPLAY 
            Order.OrderNum
            Order.CustNum
            Customer.Name
            Order.OrderDate
            . 
            
         FOR EACH OrderLine WHERE OrderLine.OrderNum = Order.OrderNum NO-LOCK:
             ASSIGN 
                    dec-total = dec-total + OrderLine.ExtendedPrice.
                DISPLAY
                    OrderLine.LineNum
                    OrderLine.Qty
                    (TOTAL) 
                    OrderLine.Price
                    OrderLine.ExtendedPrice
                    (TOTAL) 
                    WITH WIDTH 70.         
         END.
    END.
END.
