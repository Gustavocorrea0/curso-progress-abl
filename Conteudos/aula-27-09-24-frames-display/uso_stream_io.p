// USO STREAM-IO
FOR EACH order NO-LOCK:
    DISPLAY Order.CustNum
            Order.OrderDate
            Order.OrderNum
            Order.OrderStatus WITH STREAM-IO.
END.
