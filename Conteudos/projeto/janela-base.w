/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/

CREATE WIDGET-POOL.

&SCOPED-DEFINE LarguraJanela 150
&SCOPED-DEFINE AlturaJanela   25

&SCOPED-DEFINE TituloJanela   Manutenção de Clientes e Pedidos
&SCOPED-DEFINE NomePrograma   CRUD001
&SCOPED-DEFINE VersaoPrograma 2024.1.001

DEFINE VAR JanelaPrincipal AS HANDLE NO-UNDO.

DEFINE FRAME FramePrincipal
WITH 
    1 DOWN 
    NO-BOX 
    SIDE-LABELS
    SIZE {&LarguraJanela} BY {&AlturaJanela}.

CREATE WINDOW JanelaPrincipal 
ASSIGN
    HIDDEN             = YES
    TITLE              = "<insert window title>"
    HEIGHT             = {&AlturaJanela}
    WIDTH              = {&LarguraJanela}
    MAX-HEIGHT         = {&AlturaJanela}
    MAX-WIDTH          = {&LarguraJanela}
    VIRTUAL-HEIGHT     = {&AlturaJanela}
    VIRTUAL-WIDTH      = {&LarguraJanela}
    RESIZE             = NO
    SCROLL-BARS        = no
    STATUS-AREA        = no
    BGCOLOR            = ?
    FGCOLOR            = ?
    KEEP-FRAME-Z-ORDER = yes
    THREE-D            = yes
    MESSAGE-AREA       = no
    SENSITIVE          = yes.

ON  END-ERROR OF JanelaPrincipal OR 
    ENDKEY OF JanelaPrincipal ANYWHERE DO:
    
    IF THIS-PROCEDURE:PERSISTENT THEN 
        RETURN NO-APPLY.
        
END.

ON WINDOW-CLOSE OF JanelaPrincipal
DO:
    APPLY "CLOSE":U TO THIS-PROCEDURE.
    RETURN NO-APPLY.
END.

ASSIGN CURRENT-WINDOW                = JanelaPrincipal 
       THIS-PROCEDURE:CURRENT-WINDOW = JanelaPrincipal.

ON CLOSE OF THIS-PROCEDURE 
DO:
    RUN DesabilitarJanela.
END.

//PAUSE 0 BEFORE-HIDE.

DO ON ERROR   UNDO, LEAVE
   ON END-KEY UNDO, LEAVE:
   
    RUN HabilitarJanela.
   
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
    
END.

PROCEDURE DesabilitarJanela:
    
    DELETE OBJECT JanelaPrincipal.
    
END PROCEDURE.

PROCEDURE HabilitarJanela:

    DEFINE VARIABLE PosicaoColuna   AS DECIMAL     NO-UNDO.
    DEFINE VARIABLE PosicaoLinha    AS DECIMAL     NO-UNDO.

    ASSIGN
        PosicaoColuna           = (SESSION:WIDTH-CHARS  - JanelaPrincipal:WIDTH-CHARS ) / 2
        PosicaoLinha            = (SESSION:HEIGHT-CHARS - JanelaPrincipal:HEIGHT-CHARS) / 2   
    
        JanelaPrincipal:TITLE   = SUBSTITUTE("&1 :: &2 : &3",
                                    "{&TituloJanela}", 
                                    "{&NomePrograma}",
                                    "{&VersaoPrograma}")
                                
        JanelaPrincipal:COLUMN  = PosicaoColuna
        JanelaPrincipal:ROW     = PosicaoLinha.
            
    VIEW FRAME FramePrincipal IN WINDOW JanelaPrincipal.
    
    //abrir a query dos pedidos do cliente
    
    VIEW JanelaPrincipal.
    
END PROCEDURE.
