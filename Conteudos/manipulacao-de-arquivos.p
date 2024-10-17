DEFINE VARIABLE arquivo-selecionado AS CHARACTER   NO-UNDO.
DEFINE VARIABLE salvar AS LOGICAL     NO-UNDO.

SYSTEM-DIALOG GET-FILE arquivo-selecionado
    FILTERS 
    "Arquivo texto (*.txt)" "*.txt",
    "Arquivo listagem (*.lst)" "*.lst",
    "Todos os arquivos (*.*)" "*.*"
    
    ASK-OVERWRITE 
    
    DEFAULT-EXTENSION ".txt"
    SAVE-AS
    
    TITLE "Informe, por favor, o nome do arquivo"
    
    USE-FILENAME                             
    UPDATE salvar.
    
IF salvar THEN
DO:
    MESSAGE arquivo-selecionado
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
