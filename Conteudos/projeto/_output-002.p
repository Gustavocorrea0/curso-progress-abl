DEFINE FRAME relatorio  
    Customer.CustNum
    Customer.Name 
    Customer.Contact 
    Customer.CreditLimit
    Customer.Phone 
WITH
    DOWN
    WIDTH 120
    STREAM-IO
    NO-BOX.
    

OUTPUT TO VALUE ( "C:\Temp\output-002.txt" )

    PAGED
    NO-CONVERT // REALIZA A NAO CONVERSAO DE PARAMETROS DE TEXTO.
    .
FOR EACH customer NO-LOCK:
    DISPLAY
        Customer.CustNum
        Customer.Name 
        Customer.Contact 
        Customer.CreditLimit
        Customer.Phone
        WITH FRAME relatorio.
END.

OUTPUT CLOSE.
