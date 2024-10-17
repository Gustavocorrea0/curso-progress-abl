/*------------------------------------------------------------------------

  File:   Janela Modelo Detalhe

  Description:   Janela para detalhe, alterar e adicionar

  Input Parameters:
      buffer da tabela que mostrara o detalhe, alteracao e adicao

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/

CREATE WIDGET-POOL.

&SCOPED-DEFINE LarguraJanela 120
&SCOPED-DEFINE AlturaJanela   20

&SCOPED-DEFINE TituloJanela   Detalhe
&SCOPED-DEFINE NomePrograma   CRUOO1B
&SCOPED-DEFINE VersaoPrograma 2024.1.001

/* parametros */
DEFINE INPUT  PARAMETER acao AS CHARACTER   NO-UNDO. //adicionar,alterar,detalhar
DEFINE PARAMETER BUFFER order FOR order.

DEFINE VAR JanelaCRUDB AS HANDLE NO-UNDO.
           
DEFINE BUTTON btOK
    LABEL 'OK'
    SIZE 10 BY 1
    NO-FOCUS
    FLAT-BUTTON.
    
DEFINE BUTTON btCancelar
    LIKE btOK
    LABEL 'Cancelar'
    AUTO-ENDKEY.

DEFINE FRAME FrameCRUDB


    Order.OrderNum      AT ROW  1.5 COL 50 COLON-ALIGNED                   
    Order.CustNum       AT ROW  2.5 COL 50 COLON-ALIGNED
    Order.OrderDate     AT ROW  3.5 COL 50 COLON-ALIGNED FORMAT '99/99/9999'
    Order.ShipDate      AT ROW  4.5 COL 50 COLON-ALIGNED
    Order.PromiseDate   AT ROW  5.5 COL 50 COLON-ALIGNED FORMAT '99/99/9999'
    Order.Carrier       AT ROW  5.5 COL 50 COLON-ALIGNED
    Order.Instructions  AT ROW  6.5 COL 50 COLON-ALIGNED
    Order.PO            AT ROW  7.5 COL 50 COLON-ALIGNED
    Order.Terms         AT ROW  8.5 COL 50 COLON-ALIGNED
    Order.SalesRep      AT ROW  9.5 COL 50 COLON-ALIGNED
    Order.BillToID      AT ROW 10.5 COL 50 COLON-ALIGNED                   
    Order.ShipToID      AT ROW 11.5 COL 50 COLON-ALIGNED                   
    Order.OrderStatus   AT ROW 12.5 COL 50 COLON-ALIGNED
    Order.WarehouseNum  AT ROW 13.5 COL 50 COLON-ALIGNED
    Order.CreditCard    AT ROW 14.5 COL 50 COLON-ALIGNED
    
    btOK            AT ROW 19.5 COL 3
    btCancelar      AT ROW 19.5 COL 13
    
WITH 
    1 DOWN 
    NO-BOX 
    SIDE-LABELS
    SIZE {&LarguraJanela} BY {&AlturaJanela}
    //FONT 13.
    .

CREATE WINDOW JanelaCRUDB 
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

ON  END-ERROR OF JanelaCRUDB OR 
    ENDKEY OF JanelaCRUDB ANYWHERE DO:
    
    IF THIS-PROCEDURE:PERSISTENT THEN 
        RETURN NO-APPLY.
        
END.

ON WINDOW-CLOSE OF JanelaCRUDB
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
    
    IF AVAILABLE order THEN
    DO:
        IF acao <> "detalhar" THEN
        DO:
            ASSIGN
                order.            
        END.
    END.
    
    APPLY "CLOSE":U TO THIS-PROCEDURE.
    RETURN 'OK'.
    
END.

ASSIGN CURRENT-WINDOW                = JanelaCRUDB 
       THIS-PROCEDURE:CURRENT-WINDOW = JanelaCRUDB.

//PAUSE 0 BEFORE-HIDE.

DO ON ERROR   UNDO, LEAVE
   ON END-KEY UNDO, LEAVE:
   
    RUN HabilitarJanela.
   
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
    
END.

PROCEDURE DesabilitarJanela:
    
    DELETE OBJECT JanelaCRUDB.
    
END PROCEDURE.

PROCEDURE HabilitarJanela:

    DEFINE VARIABLE PosicaoColuna   AS DECIMAL     NO-UNDO.
    DEFINE VARIABLE PosicaoLinha    AS DECIMAL     NO-UNDO.

    ASSIGN
        PosicaoColuna           = (SESSION:WIDTH-CHARS  - JanelaCRUDB:WIDTH-CHARS ) / 2
        PosicaoLinha            = (SESSION:HEIGHT-CHARS - JanelaCRUDB:HEIGHT-CHARS) / 2   
    
        JanelaCRUDB:TITLE   = SUBSTITUTE("&1 :: &2 : &3",
                                    "{&TituloJanela}", 
                                    "{&NomePrograma}",
                                    "{&VersaoPrograma}")
                                
        JanelaCRUDB:COLUMN  = PosicaoColuna
        JanelaCRUDB:ROW     = PosicaoLinha.
            
    VIEW FRAME FrameCRUDB IN WINDOW JanelaCRUDB.
    
    //abrir a query dos pedidos do cliente
    
    VIEW JanelaCRUDB.
    
    DISPLAY
            Order.OrderNum                        
            Order.CustNum      
            Order.OrderDate    
            Order.ShipDate     
            Order.PromiseDate  
            Order.Carrier      
            Order.Instructions 
            Order.PO           
            Order.Terms        
            Order.SalesRep     
            Order.BillToID                        
            Order.ShipToID                        
            Order.OrderStatus  
            Order.WarehouseNum 
            Order.CreditCard          
        
    WITH FRAME FrameCRUDB.    
    
    IF acao = "detalhar" THEN
    DO:
        ENABLE 
            
            btOK
            btCancelar
            
        WITH FRAME FrameCRUDB.         
    END.
    ELSE
    IF acao = "adicionar" THEN
    DO:
        ENABLE 
            //Order.OrderNum                        
            Order.CustNum      
            Order.OrderDate    
            Order.ShipDate     
            Order.PromiseDate  
            Order.Carrier      
            Order.Instructions 
            Order.PO           
            Order.Terms        
            Order.SalesRep     
            Order.BillToID                        
            Order.ShipToID                        
            Order.OrderStatus  
            Order.WarehouseNum 
            Order.CreditCard             
            
            btOK
            btCancelar
            
        WITH FRAME FrameCRUDB.         
    END.
    ELSE
    IF acao = "alterar" THEN
    DO:
        ENABLE 
            
            //Order.OrderNum                        
            //Order.CustNum      
            Order.OrderDate    
            Order.ShipDate     
            Order.PromiseDate  
            Order.Carrier      
            Order.Instructions 
            Order.PO           
            Order.Terms        
            Order.SalesRep     
            Order.BillToID                        
            Order.ShipToID                        
            Order.OrderStatus  
            Order.WarehouseNum 
            Order.CreditCard             
            
            btOK
            btCancelar
            
        WITH FRAME FrameCRUDB.         
    END.
    
END PROCEDURE.

