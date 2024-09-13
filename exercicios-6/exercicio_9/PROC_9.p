FUNCTION fun-retornar-valor RETURN CHAR(INPUT char-nome AS CHAR, INPUT char-sobrenome AS CHAR):
    DEFINE VARIABLE c-nome-completo AS CHAR NO-UNDO.
    
    c-nome-completo = char-nome + " " + char-sobrenome.
    
    RETURN c-nome-completo. 
END.

DEFINE VARIABLE c-primeiro-nome AS CHARACTER LABEL "Nome"   NO-UNDO.
DEFINE VARIABLE c-sobrenome AS CHARACTER LABEL "Sobrenome"  NO-UNDO.

UPDATE
      c-primeiro-nome
      c-sobrenome.

MESSAGE fun-retornar-valor(c-primeiro-nome, c-sobrenome)
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

