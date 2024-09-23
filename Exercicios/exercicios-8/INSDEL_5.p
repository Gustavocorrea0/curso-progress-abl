DEFINE VARIABLE  codigo LIKE Customer.CustNum FORMAT ">>>>>>>>>>>>>>" NO-UNDO.

DEFINE VARIABLE char-nome-customer AS CHARACTER FORMAT "x(20)" LABEL "Name"  NO-UNDO.
DEFINE VARIABLE char-sales-customer AS CHARACTER FORMAT "x(3)" LABEL "Salesrep" NO-UNDO.

DEFINE VARIABLE log-remover-usuario AS LOGICAL LABEL "Remover Usuario(Yes/No)" NO-UNDO INITIAL NO.

REPEAT:
    UPDATE      
        codigo.
        
    FIND FIRST Customer NO-LOCK WHERE Customer.CustNum = codigo NO-WAIT NO-ERROR.
    
    IF NOT AVAIL Customer THEN
    DO:
    
       MESSAGE "Customer não encontrado" SKIP
               "Você pode criar um novo"
            VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
    
       UPDATE
            char-nome-customer
            char-sales-customer.
            
       RUN pi-adicionar-customer(INPUT char-nome-customer,
                                 INPUT char-sales-customer). 
    END.
    
    IF AVAIL Customer THEN
    DO:
    
        FOR EACH Customer WHERE Customer.CustNum = codigo:
            MESSAGE 
                    "Customer Encontrado"  SKIP(2)
                    "Name: " Customer.NAME SKIP
                    "CustNum: " Customer.CustNum
                    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
                    
        UPDATE 
            log-remover-usuario.
            
        END.

        IF log-remover-usuario = YES THEN    
           RUN pi-remover-usuario(INPUT codigo). 
        END.
        
END.
    
PROCEDURE pi-remover-usuario:
    DEF INPUT PARAMETER codigo-customer LIKE Customer.CustNum NO-UNDO.
    
    FOR FIRST Customer WHERE Customer.custnum = codigo-customer:
        DELETE Customer.
    END.
        
    MESSAGE "Customer Removido"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.

PROCEDURE pi-adicionar-customer:
    DEF INPUT PARAMETER char-nome AS CHAR FORMAT "x(20)" NO-UNDO.
    DEF INPUT PARAMETER char-salesrep AS CHAR FORMAT "x(3)" NO-UNDO.
    
    CREATE Customer.
    UPDATE
        Customer.NAME = char-nome
        Customer.SalesRep = char-salesrep.
        
    MESSAGE "Customer Criado"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
