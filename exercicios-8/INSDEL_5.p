DEFINE VARIABLE  codigo LIKE Customer.CustNum FORMAT ">>>>>>>>>>>>>>" NO-UNDO.
DEFINE VARIABLE  log-valor AS LOGICAL     NO-UNDO.

REPEAT:
    UPDATE      
        codigo.
        
    FIND FIRST Customer NO-LOCK WHERE Customer.CustNum = codigo NO-WAIT NO-ERROR.
    
    IF AVAIL Customer THEN
    DO:
    
        FIND CURRENT customer EXCLUSIVE-LOCK.
        
        FOR FIRST Customer NO-LOCK WHERE Customer.CustNum = codigo:
            DISPLAY
                Customer.NAME WITH WIDTH 50.
        END.
        
    END.
END.
