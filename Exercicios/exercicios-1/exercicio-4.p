DEF VAR char-primeiro-nome AS CHAR FORMAT "x(20)" LABEL "Nome: " NO-UNDO.
DEF VAR char-sobrenome AS CHAR FORMAT "x(20)" LABEL "Sobrenome: " NO-UNDO.
DEF VAR char-nome-completo AS CHAR FORMAT "x(40)" NO-UNDO.
DEF VAR int-idade AS INT LABEL "Idade: " NO-UNDO.

UPDATE
      char-primeiro-nome                      
      char-sobrenome
      int-idade.

char-nome-completo = char-primeiro-nome + " " + char-sobrenome.
MESSAGE 
        "Nome completo:" char-nome-completo SKIP
        "Idade:" int-idade SKIP
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
