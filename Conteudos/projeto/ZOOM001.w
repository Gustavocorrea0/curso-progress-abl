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
&SCOPED-DEFINE AlturaJanela  20

&SCOPED-DEFINE TituloJanela   Pesquisar Clientes
&SCOPED-DEFINE NomePrograma   ZOOM001
&SCOPED-DEFINE VersaoPrograma 2024.1.001

DEFINE VAR JanelaPesquisa AS HANDLE NO-UNDO.

DEFINE OUTPUT PARAMETER registro  AS ROWID       NO-UNDO.
//DEFINE VARIABLE registro AS ROWID       NO-UNDO.

DEFINE VARIABLE codigoInicial 
    LIKE Customer.Custnum
    LABEL 'Codigo cliente'
    FORMAT '>>>,>>9'.
    
DEFINE VARIABLE codigoFinal
    LIKE customer.custnum
    FORMAT '>>>,>>9'
    INITIAL 999999.
    
DEFINE BUTTON btPesquisar
    LABEL 'Pesquisar'
    SIZE 10 BY 1
    TOOLTIP "Pesquisar"
    NO-FOCUS
    FLAT-BUTTON.
    
DEFINE IMAGE imFirst
    FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/first-32.bmp"
    SIZE-PIXELS 32 BY 32.

DEFINE IMAGE imLast
    LIKE imFirst
    FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/last-32.bmp".
    
DEFINE RECTANGLE linha1
    EDGE-PIXELS 2 
    GRAPHIC-EDGE  
    FGCOLOR 8
    NO-FILL   
    SIZE 32 BY .04.
    
DEFINE QUERY qrClientes
    FOR customer
    FIELDS( Customer.CustNum 
            Customer.Name 
            Customer.Phone 
            Customer.Contact)
    SCROLLING.
    
DEFINE BROWSE brClientes
    QUERY qrClientes
    
    DISPLAY
        Customer.CustNum 
        Customer.Name 
        Customer.Phone 
        Customer.Contact            
WITH
    13 DOWN  
    WIDTH 116
    //SIZE 146 BY 13.8
    SINGLE
    //[ SEPARATORS | NO-SEPARATORS ]
    SEPARATORS
    NO-ROW-MARKERS
    //FONT 9
    SCROLLBAR-VERTICAL
    FIT-LAST-COLUMN.
    
DEFINE BUTTON btOK
    LABEL 'OK'
    SIZE 10 BY 1
    NO-FOCUS
    FLAT-BUTTON.
    
DEFINE BUTTON btCancelar
    LIKE btOK
    LABEL 'Cancelar'
    AUTO-ENDKEY.

DEFINE FRAME FramePesquisa

    codigoInicial   AT ROW 1.5 COL 30
    codigoFinal     AT ROW 1.5 COL 80 NO-LABEL
    
    btPesquisar     AT ROW 1.5 COL 110
    
    imFirst         AT ROW 1.5 COL 54
    imLast          AT ROW 1.5 COL 74
    
    "Clientes"      AT ROW 3.5 COL 3
    linha1          AT ROW 4.8 COL 3
    
    brClientes      AT ROW 5.3 COL 3
    
    btOK            AT ROW 19.5 COL 3
    btCancelar      AT ROW 19.5 COL 13
    
WITH 
    1 DOWN 
    NO-BOX 
    SIDE-LABELS
    SIZE {&LarguraJanela} BY {&AlturaJanela}
    //FONT 13.

CREATE WINDOW JanelaPesquisa 
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

ON  END-ERROR OF JanelaPesquisa OR 
    ENDKEY OF JanelaPesquisa ANYWHERE DO:
    
    IF THIS-PROCEDURE:PERSISTENT THEN 
        RETURN NO-APPLY.
        
END.

ON WINDOW-CLOSE OF JanelaPesquisa
DO:
    APPLY "CLOSE":U TO THIS-PROCEDURE.
    RETURN NO-APPLY.
END.

ON CLOSE OF THIS-PROCEDURE 
DO:
    RUN DesabilitarJanela.
END.

ON 'choose':U OF btPesquisar
DO:
    ASSIGN
        codigoInicial
        codigoFinal.
        
    RUN consultarClientes.    
END.

ON 'choose':U OF btOK 
DO:
    IF AVAILABLE Customer THEN
    DO:
       ASSIGN
            registro = ROWID( customer ).
    END.
    
    RETURN 'OK'.
    
    APPLY "CLOSE":U TO THIS-PROCEDURE.
END.

//DUPLO CLIQUE EM BOTAO

ON 'MOUSE-SELECT-DBLCLICK':U OF 
DO:
    APPLY 'choose' TO btOK.
END.

ASSIGN CURRENT-WINDOW                = JanelaPesquisa 
       THIS-PROCEDURE:CURRENT-WINDOW = JanelaPesquisa.

//PAUSE 0 BEFORE-HIDE.

DO ON ERROR   UNDO, LEAVE
   ON END-KEY UNDO, LEAVE:
   
    RUN HabilitarJanela.
   
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
    
END.

PROCEDURE DesabilitarJanela:
    
    DELETE OBJECT JanelaPesquisa.
    
END PROCEDURE.

PROCEDURE HabilitarJanela:

    DEFINE VARIABLE PosicaoColuna   AS DECIMAL     NO-UNDO.
    DEFINE VARIABLE PosicaoLinha    AS DECIMAL     NO-UNDO.

    ASSIGN
        PosicaoColuna           = (SESSION:WIDTH-CHARS  - JanelaPesquisa:WIDTH-CHARS ) / 2
        PosicaoLinha            = (SESSION:HEIGHT-CHARS - JanelaPesquisa:HEIGHT-CHARS) / 2   
    
        JanelaPesquisa:TITLE   = SUBSTITUTE("&1 :: &2 : &3",
                                    "{&TituloJanela}", 
                                    "{&NomePrograma}",
                                    "{&VersaoPrograma}")
                                
        JanelaPesquisa:COLUMN  = PosicaoColuna
        JanelaPesquisa:ROW     = PosicaoLinha.
            
    VIEW FRAME FramePesquisa IN WINDOW JanelaPesquisa.
    
    //abrir a query dos pedidos do cliente
    
    VIEW JanelaPesquisa.
    
    DISPLAY
        codigoInicial
        codigoFinal
        
    WITH FRAME framePesquisa.    
    
    ENABLE 
        codigoInicial
        codigoFinal
        
        btPesquisar
        
        brClientes
        
        btOK
        btCancelar
        
    WITH FRAME FramePesquisa.    
    
END PROCEDURE.

PROCEDURE consultarClientes:
    /* abrir a consulta de clientes conforme os valores inicial e final */
    OPEN QUERY qrClientes
        FOR EACH customer
        NO-LOCK
        WHERE customer.custnum >= codigoInicial
        AND   customer.custnum <= codigoFinal.    
END.
