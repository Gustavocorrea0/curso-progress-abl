DEF VAR char-nome AS CHAR FORMAT "x(20)" NO-UNDO.
DEF VAR char-sobrenome AS CHAR FORMAT "x(20)" NO-UNDO.
DEF VAR char-nome-completo AS CHAR FORMAT "x(20)" NO-UNDO.

UPDATE char-nome LABEL "Nome: ".
UPDATE char-sobrenome LABEL "Sobrenome: ".

ASSIGN char-nome-completo = char-nome + " " + char-sobrenome.

MESSAGE 
        "Nome: " char-nome SKIP
        "Sobrenome: " char-sobrenome SKIP
        "Nome completo: " char-nome-completo
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
