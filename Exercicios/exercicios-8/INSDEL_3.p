DEFINE VARIABLE codigo LIKE Customer.CustNum FORMAT '>>>>>>>>>>>' NO-UNDO.
DEFINE VARIABLE char-confirmar-remocao AS LOG NO-UNDO LABEL "Remover Registro (yes/no)".

REPEAT:
        UPDATE
            codigo.
         
        FIND FIRST customer NO-LOCK WHERE Customer.CustNum = codigo NO-WAIT NO-ERROR.

        IF AVAIL customer THEN DO:

            FIND CURRENT customer EXCLUSIVE-LOCK.
            
            FOR FIRST Customer NO-LOCK WHERE Customer.custnum = codigo:
                DISPLAY 
                    Customer.NAME WITH WIDTH 50.
            END.

            UPDATE 
                char-confirmar-remocao.

            IF char-confirmar-remocao THEN
               DO ON ERROR UNDO:
                 FOR FIRST Customer WHERE Customer.custnum = codigo:
    
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
