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
    
// CABECALHO DO PROGRAMA    
DEFINE FRAME cabecalho
    HEADER
        FILL("-", 120) AT 1 FORMAT 'x(120)'
        SKIP
        "output-002.p" AT 1
        "Listagem de clientes" AT 55
        NOW FORMAT "99/99/9999 HH:MM:SS" TO 120
        SKIP
        FILL("-", 120) AT 1 FORMAT 'x(120)'
WITH 
    PAGE-TOP
    WIDTH 120
    STREAM-IO
    NO-BOX.
    
DEFINE FRAME rodape
    HEADER
        FILL("-", 120) AT 1 FORMAT 'x(120)'
        SKIP
        "G.A. LTDA" AT 1
        "pag."  AT 107
        PAGE-NUMBER TO 120
WITH 
    PAGE-TOP
    WIDTH 120
    STREAM-IO
    NO-BOX.
    

OUTPUT TO VALUE ( "C:\Temp\output-002.txt" )

    PAGED
    NO-CONVERT // REALIZA A NAO CONVERSAO DE PARAMETROS DE TEXTO.
    . 
    
VIEW FRAME cabecalho.


FOR EACH customer NO-LOCK:
    DISPLAY
        Customer.CustNum
        Customer.Name 
        Customer.Contact 
        Customer.CreditLimit
        Customer.Phone
        WITH FRAME relatorio.
END.

VIEW FRAME rodape.

OUTPUT CLOSE.
