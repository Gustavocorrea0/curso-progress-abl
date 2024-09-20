FUNCTION fun-retornar-nome-completo RETURN CHAR(INPUT char-nome AS CHAR, INPUT char-sobrenome AS CHAR):
    DEFINE VARIABLE c-nome-completo AS CHAR NO-UNDO.
    
    c-nome-completo = char-nome + " " + char-sobrenome.
    
    RETURN c-nome-completo. 
END.

DEFINE VARIABLE c-primeiro-nome AS CHARACTER LABEL "Nome" FORMAT "x(20)"  NO-UNDO.
DEFINE VARIABLE c-sobrenome AS CHARACTER LABEL "Sobrenome" FORMAT "x(20)" NO-UNDO.

UPDATE
      c-primeiro-nome
      c-sobrenome.

MESSAGE fun-retornar-nome-completo(c-primeiro-nome, c-sobrenome)
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

