/* 
    Com FOR EACH e BUFFER, mostre os campos da tabela pedidos(order).
*/

DEF BUFFER buf-order FOR order.

FOR EACH order NO-LOCK:
            
      FIND LAST buf-order  NO-LOCK WHERE buf-order.Ordernum = Order.Ordernum NO-ERROR.
      
      DISPLAY 
            buf-order.BillToID
            buf-order.Carrier
            buf-order.Creditcard
            buf-order.CustNum
            buf-order.Instructions
            buf-order.OrderDate
            buf-order.Ordernum
            buf-order.OrderStatus
            buf-order.PO
            buf-order.PromiseDate 
            buf-order.SalesRep
            buf-order.ShipDate 
            buf-order.ShipToID
            buf-order.Terms
            buf-order.WarehouseNum WITH WIDTH 499.
END.