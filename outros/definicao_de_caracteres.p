DEF VAR nome AS CHAR NO-UNDO.
DEF VAR nomeMeio AS CHAR NO-UNDO.
DEF VAR sobrenome AS CHAR NO-UNDO.

DEF VAR nomeCompleto AS CHAR NO-UNDO.

ASSIGN 
    nome = "Gustavo"
    nomeMeio = ?
    sobrenome = "Alfredo"
    
    // SUBTITUTE NAO 
    nomeCompleto = SUBSTITUTE("&1, &2, &3",
                              nome,
                              nomeMeio,
                              sobrenome).
    
DISPLAY nomeCompleto.

MESSAGE "O nome completo é" nomeCompleto
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
