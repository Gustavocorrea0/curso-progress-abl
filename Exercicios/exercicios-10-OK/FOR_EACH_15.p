DEFINE VARIABLE dec-total AS DECIMAL LABEL "Total"     NO-UNDO.


FOR EACH Order NO-LOCK:
    ASSIGN 
        dec-total = 0.
        
    FOR FIRST Customer WHERE Customer.CustNum = Order.CustNum NO-LOCK:
    DISPLAY 
            Order.OrderNum
            Order.CustNum
            Customer.Name
            Order.OrderDate WITH WIDTH 90. 
            
         FOR EACH OrderLine WHERE OrderLine.OrderNum = Order.OrderNum NO-LOCK:
             ASSIGN 
                    dec-total = dec-total + OrderLine.ExtendedPrice.
                DISPLAY
                    OrderLine.LineNum
                    OrderLine.Qty 
                    OrderLine.Price
                    OrderLine.ExtendedPrice WITH WIDTH 70.         
         END.
         
     DISPLAY dec-total WITH WIDTH 90.
        
    END.
END.
