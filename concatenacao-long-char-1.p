/* CONCATENACAO DE LONGCHAR */

DEF VAR nomeExtendido AS LONGCHAR NO-UNDO.

/* concatenacao de longchar limitada em 32000 bytes */
ASSIGN
    nomeExtendido = "Gustavo Alfredo" + "Programador" + FILL('.', 31990).
    
DISPLAY
    STRING(nomeExtendido) FORMAT 'x(40)'
