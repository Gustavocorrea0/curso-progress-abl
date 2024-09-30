DEFINE VARIABLE data-pedido-1 LIKE Order.OrderDate LABEL "Data Inicial" NO-UNDO.
DEFINE VARIABLE data-pedido-2 LIKE Order.OrderDate LABEL "Data Final" NO-UNDO.
DEFINE VARIABLE char-nome-cliente LIKE Customer.NAME LABEL "Nome Do Cliente"   NO-UNDO.

REPEAT:
    UPDATE 
        data-pedido-1
        data-pedido-2
        char-nome-cliente.
        
    FOR EACH Order, Customer WHERE 
                    Order.OrderDate > data-pedido-1 AND
                    Order.OrderDate < data-pedido-2 AND
                    Customer.NAME = char-nome-cliente NO-LOCK:
        DISPLAY
               Order.OrderDate 
               Order.OrderNum
               Order.OrderStatus
               Order.CustNum
               Customer.NAME WITH WIDTH 100.
    END.
END.
