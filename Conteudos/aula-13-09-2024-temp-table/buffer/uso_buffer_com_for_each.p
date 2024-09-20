/* Buffer com FOR EACH */

DEF BUFFER buf-customer FOR customer.

FOR EACH customer NO-LOCK:
    DISPLAY 
        customer.custnum
        customer.NAME
        customer.salesrep.
    
    FIND LAST buf-customer NO-LOCK WHERE buf-customer.salesrep = customer.salesrep NO-ERROR.
    
    DISPLAY buf-customer.salesrep LABEL "Representante".
END.
