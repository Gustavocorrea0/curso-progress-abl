DEFINE VARIABLE int-order-num LIKE Order.OrderNum   NO-UNDO.
DEFINE VARIABLE int-cod-customer AS INT64       NO-UNDO.

REPEAT:

    UPDATE int-order-num.

    FOR FIRST Order WHERE Order.OrderNum = int-order-num:
        DISPLAY
            Order.OrderNum
            Order.OrderDate 
            Order.CustNum
            Order.SalesRep.
        
        UPDATE 
            int-cod-customer = Order.CustNum.
            
       FOR FIRST Customer WHERE Customer.CustNum = int-cod-customer:
            DISPLAY
                Customer.Phone
                Customer.Name.
        END.
    END.

END.
