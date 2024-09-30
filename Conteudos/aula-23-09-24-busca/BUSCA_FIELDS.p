FOR FIRST customer FIELDS(Customer.Custnum
                          Customer.NAME
                          Customer.Contact) 
                          // NO-LOCK - ao omitir a opcao de lock a ABL usa SHARE-LOCK por padrao
                          EXCLUSIVE-LOCK
                          WHERE Customer.Country = "France" 
                          NO-PREFETCH:
END.

IF AVAILABLE Customer THEN
DO:
   DISPLAY 
        Customer.custnum.
   UPDATE
        Customer.NAME
        Customer.Contact.
END.
