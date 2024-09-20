DEF TEMP-TABLE tt-customer LIKE customer.

FOR EACH customer NO-LOCK:
    CREATE tt-customer.
    BUFFER-COPY customer TO tt-customer.
END.

FOR EACH tt-customer:
    DISPLAY 
            tt-customer.CustNum
            tt-customer.NAME.
                                         
END.
