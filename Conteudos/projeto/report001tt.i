DEFINE TEMP-TABLE tt-param
    FIELD clienteInicial LIKE Customer.custnum
    FIELD clienteFinal   LIKE Customer.custnum
    FIELD nomeClienteInicial LIKE Customer.NAME
    FIELD nomeClienteFinal LIKE Customer.NAME
    FIELD destinoImpressao AS CHARACTER
    FIELD arquivoImpressao AS CHARACTER.
