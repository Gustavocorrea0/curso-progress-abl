/*
    TEMP-TABLE: sao tabelas que podem armazenar temporariamente grandes volumes de dados,
    estes registros sao armazenados apenas durante a execucao do programa. Estes devem
    indices e as demais caracteristicas de uma tabela.
    
    As TEMP-TABLES pode ser imagens(copias) de tabelas do banco de dados, com possibilidade
    de adicao de novos dados e indices
*/

/*
    TIPO 1 - tabela temporaria com estrutura identica a uma tabela do banco
*/

DEF TEMP-TABLE tt-customer LIKE customer.

CREATE tt-customer.
UPDATE tt-customer
    WITH
    1 COL
    WIDTH 222.






