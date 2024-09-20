FUNCTION fun-retornar-nome-completo RETURN CHAR(INPUT char-nome AS CHAR, INPUT char-sobrenome AS CHAR):
    DEFINE VARIABLE c-nome-completo AS CHAR NO-UNDO.
    
    c-nome-completo = char-nome + " " + char-sobrenome.
    
    RETURN c-nome-completo. 
END.
