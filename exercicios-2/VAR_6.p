/*
    Exercicio 6: Crie um novo programa a partir do segundo exercicio, neste a variavel decimal
    deverá ser visualizada (VIEW-AS) como FILL-IN.
*/

DEF VAR int-valor 
    AS DEC
    LABEL "inteiro"
    INITIAL 0.
    
UPDATE int-valor VIEW-AS FILL-IN LABEL "Valor"
    WITH FRAME b SIDE-LABELS.
    
MESSAGE int-valor
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
