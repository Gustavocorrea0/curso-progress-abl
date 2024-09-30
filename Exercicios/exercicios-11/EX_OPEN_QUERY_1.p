DEFINE VARIABLE int-codigo-inicial AS INT64 LABEL "Codigo Inicial"      NO-UNDO.
DEFINE VARIABLE int-codigo-final AS INT64 LABEL "Codigo Final"      NO-UNDO.

UPDATE 
      int-codigo-inicial
      int-codigo-final.
      
OPEN QUERY q-codigo-customer
    FOR EACH Customer NO-LOCK 
        WHERE Customer.CustNum > int-codigo-inicial AND Customer.CustNum < int-codigo-final.
        
GET FIRST q-codigo-customer EXCLUSIVE-LOCK.

REPEAT WHILE AVAILABLE customer:
    DISPLAY 
        Customer.CustNum
        Customer.Name
        Customer.CreditLimit.
        
    GET NEXT q-codigo-customer EXCLUSIVE-LOCK.
END.