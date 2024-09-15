/* Tipo 1: Exemplo TEMP-TABLE com indices*/

/*
    INDEX  = é uma estrutura que melhora a performance das operações de busca e ordenação em tabelas de banco de dados
*/

DEF TEMP-TABLE tt-customer LIKE customer.

/* like outra TT*/
DEF TEMP-TABLE tt-customer-ex LIKE tt-customer.

DEF TEMP-TABLE tt-customer-2
    FIELD i-codigo AS INT
    FIELD c-nome AS CHAR FORMAT "x(35)"
    FIELD endereco AS CHAR
    
    INDEX ix-codigo AS UNIQUE AS PRIMARY i-codigo
    INDEX ix-nome c-nome.
    
DEF TEMP-TABLE tt-customer-3 LIKE customer
    FIELD i-codigo AS INT
    FIELD c-filiacao AS CHAR FORMAT "x(35)" LABEL "Filiacao".
    
CREATE tt-customer-3.
UPDATE tt-customer-3 WITH 1 COL SIZE 122 BY 8.
