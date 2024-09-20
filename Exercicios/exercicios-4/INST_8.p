/*
    8 - Verifique se a variavel nome completo nao se inicia por "A"
*/

DEFINE VARIABLE char-nome-completo AS CHARACTER LABEL "Nome completo" FORMAT "x(30)"   NO-UNDO.

UPDATE 
    char-nome-completo.
    
IF char-nome-completo BEGINS "a" THEN
    MESSAGE "A palavra começa com A"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
ELSE
    MESSAGE "A palavra nao começa com A"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
