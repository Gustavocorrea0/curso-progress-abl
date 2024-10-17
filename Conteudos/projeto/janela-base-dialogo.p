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

&SCOPED-DEFINE LarguraJanela 120
&SCOPED-DEFINE AlturaJanela   20

&SCOPED-DEFINE TituloJanela   
&SCOPED-DEFINE NomePrograma   
&SCOPED-DEFINE VersaoPrograma 2024.1.001


//DEFINE VARIABLE registro AS ROWID       NO-UNDO.


DEFINE VAR JanelaDialogo AS HANDLE NO-UNDO.
    
DEFINE BUTTON btOK
    LABEL 'OK'
    SIZE 10 BY 1
    NO-FOCUS
    FLAT-BUTTON.
    
DEFINE BUTTON btCancelar
    LIKE btOK
    LABEL 'Cancelar'
    AUTO-ENDKEY.

DEFINE FRAME FrameDialogo

    /*
    codigoInicial   AT ROW 1.5 COL 30
    codigoFinal     AT ROW 1.5 COL 80 NO-LABEL
    
    btPesquisar     AT ROW 1.5 COL 110
    
    imFirst         AT ROW 1.5 COL 54
    imLast          AT ROW 1.5 COL 74
    
    "Clientes"      AT ROW 3.5 COL 3
    linha1          AT ROW 4.8 COL 3
    
    brClientes      AT ROW 5.3 COL 3
    */
    
    btOK            AT ROW 19.5 COL 3
    btCancelar      AT ROW 19.5 COL 13
    
WITH 
    1 DOWN 
    NO-BOX 
    SIDE-LABELS
    SIZE {&LarguraJanela} BY {&AlturaJanela}
    FONT 13.

CREATE WINDOW JanelaDialogo 
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

ON  END-ERROR OF JanelaDialogo OR 
    ENDKEY OF JanelaDialogo ANYWHERE DO:
    
    IF THIS-PROCEDURE:PERSISTENT THEN 
        RETURN NO-APPLY.
        
END.

ON WINDOW-CLOSE OF JanelaDialogo
DO:
    APPLY "CLOSE":U TO THIS-PROCEDURE.
    RETURN NO-APPLY.
END.

ON CLOSE OF THIS-PROCEDURE 
DO:
    RUN DesabilitarJanela.
END.

ON 'choose':U OF btOK
DO:
/*     DEBUGGER:INITIATE().  */
/*     DEBUGGER:SET-BREAK(). */
        
    APPLY "CLOSE":U TO THIS-PROCEDURE.
    RETURN 'OK'.
    
END.

ASSIGN CURRENT-WINDOW                = JanelaDialogo 
       THIS-PROCEDURE:CURRENT-WINDOW = JanelaDialogo.

//PAUSE 0 BEFORE-HIDE.

DO ON ERROR   UNDO, LEAVE
   ON END-KEY UNDO, LEAVE:
   
    RUN HabilitarJanela.
   
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
    
END.

PROCEDURE DesabilitarJanela:
    
    DELETE OBJECT JanelaDialogo.
    
END PROCEDURE.

PROCEDURE HabilitarJanela:

    DEFINE VARIABLE PosicaoColuna   AS DECIMAL     NO-UNDO.
    DEFINE VARIABLE PosicaoLinha    AS DECIMAL     NO-UNDO.

    ASSIGN
        PosicaoColuna           = (SESSION:WIDTH-CHARS  - JanelaDialogo:WIDTH-CHARS ) / 2
        PosicaoLinha            = (SESSION:HEIGHT-CHARS - JanelaDialogo:HEIGHT-CHARS) / 2   
    
        JanelaDialogo:TITLE   = SUBSTITUTE("&1 :: &2 : &3",
                                    "{&TituloJanela}", 
                                    "{&NomePrograma}",
                                    "{&VersaoPrograma}")
                                
        JanelaDialogo:COLUMN  = PosicaoColuna
        JanelaDialogo:ROW     = PosicaoLinha.
            
    VIEW FRAME FrameDialogo IN WINDOW JanelaDialogo.
    
    //abrir a query dos pedidos do cliente
    
    VIEW JanelaDialogo.
    
    DISPLAY
        
    WITH FRAME FrameDialogo.    
    
    ENABLE 
        
        btOK
        btCancelar
        
    WITH FRAME FrameDialogo.    
    
END PROCEDURE.
