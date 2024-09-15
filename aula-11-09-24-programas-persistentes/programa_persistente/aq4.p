/*persistente-002b*/
PROCEDURE get-nome-cliente:
    // IPI
    DEFINE INPUT  PARAMETER p-codigo-cliente AS INT64     NO-UNDO.
    
    // OPC
    DEFINE OUTPUT PARAMETER p-nome-cliente AS CHARACTER   NO-UNDO.
    
    FIND FIRST Customer.
    WHERE Customer.CustNum = p-codigo-cliente
    NO-LOCK
    NO-PREFETCH // PARA NAO ENVIAR OS REGISTROS ADICIONAIS QUE O BANCO ENVIA
    NO-ERROR.
   
   IF AVAILABLE Customer THEN
   DO:
      ASSIGN
            p-codigo-cliente = Customer.NAME.
   END.
    
END.
