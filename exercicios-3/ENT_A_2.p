DEFINE VARIABLE nome AS CHARACTER LABEL "Nome"  FORMAT "x(20)"  NO-UNDO.
DEFINE VARIABLE sobrenome AS CHARACTER LABEL "Sobrenome" FORMAT "x(20)" NO-UNDO.

UPDATE 
      nome
      sobrenome.

MESSAGE "Nome:" nome SKIP
        "Sobrenome:" sobrenome
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.