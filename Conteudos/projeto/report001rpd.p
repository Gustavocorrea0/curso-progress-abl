/* PROGRAMA report001rpa */
{Conteudos\projeto\report001tt.i}

/* RECEBE O PARAMETRO RAW PARA A tt-param*/
DEFINE INPUT PARAMETER raw-param AS RAW.

DEFINE STREAM arquivo.

DEFINE STREAM frAcompanha.

CREATE tt-param.

RAW-TRANSFER FIELD raw-param TO tt-param.

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

DEFINE VARIABLE textoAcompanha AS CHARACTER NO-UNDO.

// JANELA DE ACOMPANHAMENTO
DEFINE FRAME acompanha
    textoAcompanha AT ROW 2 COL 15
WITH 
    SIZE 80 BY 5
    1 DOWN
    SIDE-LABELS
    FONT 12
    TITLE "Imprimindo"
    NO-LABELS
    VIEW-AS DIALOG-BOX. // TODOS OS CAMPOS DA FRAME SEM ROTULO

OUTPUT TO VALUE ( "C:\Temp\output-002.txt" )
STREAM arquivo
    TO TERMINAL
    PAGED
    NO-CONVERT // REALIZA A NAO CONVERSAO DE PARAMETROS DE TEXTO.
    . 
    
STREAM arquivo
    TO TERMINAL.
    
VIEW STREAM arquivo FRAME cabecalho.
VIEW STREAM arquivo FRAME rodape.
VIEW FRAME cabecalho.


FOR EACH customer NO-LOCK 
WHERE Customer.custnum >= tt-param.clienteInicial
AND Customer.custnum <= tt-param.clienteFinal
AND customer.NAME >= tt-param.nomeClienteInicial
AND customer.NAME <= tt-param.nomeClienteFinal:

    ASSIGN 
        textoAcompanha = SUBSTITUTE("Imprimindo.. &1 &2",
                                    customer.custnum,
                                    customer.NAME
                                   ).
        DISPLAY textoAcompanha.

    DISPLAY
        STREAM arquivo
        Customer.CustNum
        Customer.Name 
        Customer.Contact 
        Customer.CreditLimit
        Customer.Phone
        WITH 
        FRAME relatorio.
END.

VIEW FRAME rodape.

OUTPUT STREAM frAcompanha CLOSE.
OUTPUT STREAM arquivo CLOSE.
