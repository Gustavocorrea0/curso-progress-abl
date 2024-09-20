DEF BUFFER buf-customer FOR Customer.

DEF TEMP-TABLE tt-customer LIKE Customer
    INDEX ix-custnum custnum.  

    // ERRO  = N�o foi poss�vel encontrar o �ndice ix-custnum na tabela Cliente. (229)
    // CORRECAO =  REMOVER "USE-INDEX ix-custnum" do FOR EACH
FOR EACH customer USE-INDEX ix-custnum NO-LOCK:
    CREATE tt-customer.
    BUFFER-COPY customer TO tt-customer.
END.

FOR EACH tt-customer USE-INDEX ix-custnum NO-LOCK:
//FOR EACH tt-customer NO-LOCK:
    DISPLAY
        tt-customer.Balance
        tt-customer.City
        tt-customer.Contact
        tt-customer.Country
        tt-customer.CreditLimit
        tt-customer.CustNum
        tt-customer.Name
        tt-customer.Phone
        tt-customer.PostalCode
        tt-customer.SalesRep
        tt-customer.State
        
        WITH WIDTH 250.
END.
