// A partir do primeiro exercício, crie mais uma query para listar os pedidos do cliente, use clausulas where para realizar a junção entre as duas tabelas.
DEFINE VARIABLE int-codigo-inicial AS INT64 LABEL "Codigo Inicial"      NO-UNDO.
DEFINE VARIABLE int-codigo-final AS INT64 LABEL "Codigo Final"      NO-UNDO.
DEFINE VARIABLE int-cust-num LIKE Customer.CustNum       NO-UNDO.

UPDATE 
      int-codigo-inicial
      int-codigo-final.

FOR FIRST Customer WHERE Customer.CustNum > int-codigo-inicial AND Customer.CustNum < int-codigo-inicial NO-LOCK:
END.
  
OPEN QUERY q-listar-pedidos 
     FOR EACH Order NO-LOCK
            WHERE Order.CustNum = int-cust-num.
      
OPEN QUERY q-codigo-customer
     FOR EACH Customer NO-LOCK 
            WHERE Customer.CustNum = int-cust-num.
        
GET FIRST q-codigo-customer EXCLUSIVE-LOCK.
GET FIRST q-codigo-customer EXCLUSIVE-LOCK.

REPEAT WHILE AVAILABLE Customer AND AVAILABLE Order:
    DISPLAY 
        Customer.CustNum
        Customer.Name
        Customer.CreditLimit
        Order.OrderNum
        Order.OrderDate.
        
    GET NEXT q-listar-pedidos.
END.
