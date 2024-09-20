REPEAT:
    CREATE customer.
    UPDATE
          customer.NAME
          customer.salesrep.
    
    MESSAGE "Cadastrar Novamente" 
        VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO
        TITLE "" UPDATE l-sair AS LOGICAL.
        
    CASE l-sair:
        WHEN FALSE THEN
        DO:
            QUIT.
        END.
    END CASE.
END.