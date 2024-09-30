DEFINE VARIABLE int-order-num LIKE Order.OrderNum   NO-UNDO.
DEFINE VARIABLE int-cod-customer AS INT64       NO-UNDO.
DEFINE VARIABLE char-sales-rep AS CHAR  NO-UNDO.

REPEAT:
    UPDATE int-order-num.
    FOR FIRST Order WHERE Order.OrderNum = int-order-num:
        UPDATE int-cod-customer = Order.CustNum.
        FOR FIRST Customer WHERE Customer.CustNum = int-cod-customer:
            UPDATE char-sales-rep = Customer.SalesRep.
            FOR FIRST SalesRep WHERE SalesRep.SalesRep = char-sales-rep:
                DISPLAY
                    Order.OrderNum
                    Order.OrderDate 
                    Order.CustNum
                    Order.SalesRep
                    Customer.Phone
                    Customer.Name
                    SalesRep.RepName WITH WIDTH 100.
            END.
        END.
    END.
END.
