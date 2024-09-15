/*  Buffers - sao objetos para acessarmos os registros em tabelas do banco de dados
    e para tabelas temporarias.   
*/

/* Uso de buffer e FIND*/

DEF BUFFER buf-customer FOR customer.

FIND FIRST buf-customer WHERE buf-customer.custnum = 10. 
