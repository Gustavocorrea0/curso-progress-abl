DEFINE VARIABLE codigo LIKE Customer.CustNum FORMAT '>>>>>>>>>>>' NO-UNDO.
DEFINE VARIABLE char-confirmar-remocao AS LOG NO-UNDO LABEL "Remover Registro (yes/no)".

REPEAT:

        // RECEBE O CODIGO DO CUSTOMER 
        UPDATE
            codigo.
         
        // BUSCA O USUARIO 
        FIND FIRST customer NO-LOCK WHERE Customer.CustNum = codigo NO-WAIT NO-ERROR.
        
        // CONFIRMA SE O CUSTOMER É VALIDO
        IF AVAIL customer THEN DO:
        
            // TORNA A SESSAO EXCLUSIVA PARA O USUARIO
            FIND CURRENT customer EXCLUSIVE-LOCK.
            
            // BUSCA O CUSTOMER
            FOR FIRST Customer NO-LOCK WHERE Customer.custnum = codigo:
                DISPLAY 
                    Customer.NAME WITH WIDTH 50.
            END.
            
            // RECEBE A CONFIRMACAO OU NAO A REMOCAO
            UPDATE 
                char-confirmar-remocao.
            
            // VALIDA A REMOCAO
            IF char-confirmar-remocao THEN
               DO:
                 // BUSCA O CUSTOMER POR CODIGO
                 FOR FIRST Customer WHERE Customer.custnum = codigo:
                 // REMOVE O CUSTOMER BUSCADO
                 DELETE customer.
                 
                 MESSAGE "Customer Removido"
                     VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.      
            END.
            END.
            
        END.    
        ELSE
            MESSAGE "Customer não existe"
                VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.      
END.
