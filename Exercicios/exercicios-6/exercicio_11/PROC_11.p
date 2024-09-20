DEFINE VARIABLE h-programa AS HANDLE      NO-UNDO.

DEFINE VARIABLE c-nome AS CHARACTER LABEL "Nome"   NO-UNDO FORMAT "x(20)".
DEFINE VARIABLE c-sobrenome AS CHARACTER LABEL "Sobrenome"   NO-UNDO  FORMAT "x(20)".
DEFINE VARIABLE c-nome-completo AS CHARACTER   NO-UNDO.

FUNCTION fun-retornar-nome-completo RETURNS CHAR(char-nome AS CHAR, char-sobrenome AS CHAR) IN h-programa.

RUN exercicios-6\exercicio_11\PROC_9.p PERSISTENT SET h-programa.

UPDATE 
    c-nome
    c-sobrenome.
    
c-nome-completo = fun-retornar-nome-completo(c-nome, c-sobrenome). 

MESSAGE c-nome-completo
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

DELETE OBJECT h-programa.
