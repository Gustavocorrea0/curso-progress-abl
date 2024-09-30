//Localize todos os clientes do representante (salesrep) DOS. Utilize a opcao Where.
DEFINE VARIABLE i-cont AS INT64       NO-UNDO.

FOR EACH Customer WHERE Customer.SalesRep = "DOS":
    i-cont = i-cont + 1.
    DISPLAY
        i-cont
        Customer.SalesRep
        Customer.NAME
        .
END.
