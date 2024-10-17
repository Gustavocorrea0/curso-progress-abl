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

&SCOPED-DEFINE TituloJanela   Detalhe
&SCOPED-DEFINE NomePrograma   CRUD001a
&SCOPED-DEFINE VersaoPrograma 2024.1.001

DEFINE INPUT  PARAMETER acao AS CHARACTER   NO-UNDO. // ADICIONAR, ALTERAR, DETALHAR
DEFINE PARAMETER BUFFER customer FOR customer.

DEFINE VAR JanelaCRUDA AS HANDLE NO-UNDO.
  
DEFINE BUTTON btOK
    LABEL 'OK'
    SIZE 10 BY 1
    NO-FOCUS
    FLAT-BUTTON.
    
DEFINE BUTTON btCancelar
    LIKE btOK
    LABEL 'Cancelar'
    AUTO-ENDKEY.

DEFINE FRAME FrameCRUDA

  Customer.NAME             AT ROW 1.5 COL 50
  Customer.CustNum          AT ROW 2.5 COL 50
        
  Customer.Address          AT ROW 3.5 COL 50
  Customer.Address2         AT ROW 4.5 COL 50
  Customer.PostalCode       AT ROW 5.5 COL 50
  Customer.City             AT ROW 6.5 COL 50
  Customer.State            AT ROW 7.5 COL 50
  Customer.Country          AT ROW 8.5 COL 50
                       
  Customer.Contact          AT ROW 9.5 COL 50
  Customer.Phone            AT ROW 10.5 COL 50
  Customer.Fax              AT ROW 11.5 COL 50
  Customer.EmailAddressAT   AT ROW 12.5 COL 50
                                    
  Customer.SalesRep         AT ROW 13.5 COL 50
  Customer.CreditLimit      AT ROW 14.5 COL 50
  Customer.Balance          AT ROW 15.5 COL 50
  Customer.Terms            AT ROW 16.5 COL 50
  Customer.Discount         AT ROW 17.5 COL 50
                            
  Customer.Comments         AT ROW 19.5 COL 50 COLON-ALIGNED FORMAT "x(60)"

  btOK                      AT ROW 19.5 COL 3
  btCancelar                AT ROW 19.5 COL 13
    
WITH 
    1 DOWN 
    NO-BOX 
    SIDE-LABELS
    SIZE {&LarguraJanela} BY {&AlturaJanela}
    //FONT 13.

CREATE WINDOW JanelaCRUDA

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

ON  END-ERROR OF JanelaCRUDA OR 
    ENDKEY OF JanelaCRUDA ANYWHERE DO:
    
    IF THIS-PROCEDURE:PERSISTENT THEN 
        RETURN NO-APPLY.
        
END.

ON WINDOW-CLOSE OF JanelaCRUDA
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
       IF acao <> "detalhar" THEN
       DO:
           ASSIGN
                customer.
       END.
    END.
    
    APPLY "CLOSE":U TO THIS-PROCEDURE.
    RETURN "OK".
END.

//PAUSE 0 BEFORE-HIDE.

DO ON ERROR   UNDO, LEAVE
   ON END-KEY UNDO, LEAVE:
   
    RUN HabilitarJanela.
   
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
    
END.

PROCEDURE DesabilitarJanela:
    
    DELETE OBJECT JanelaCRUDA.
    
END PROCEDURE.

PROCEDURE HabilitarJanela:

    DEFINE VARIABLE PosicaoColuna   AS DECIMAL     NO-UNDO.
    DEFINE VARIABLE PosicaoLinha    AS DECIMAL     NO-UNDO.

    ASSIGN
        PosicaoColuna           = (SESSION:WIDTH-CHARS  - JanelaCRUDA:WIDTH-CHARS ) / 2
        PosicaoLinha            = (SESSION:HEIGHT-CHARS - JanelaCRUDA:HEIGHT-CHARS) / 2   
    
        JanelaCRUDA:TITLE   = SUBSTITUTE("&1 :: &2 : &3",
                                    "{&TituloJanela}", 
                                    "{&NomePrograma}",
                                    "{&VersaoPrograma}")
                                
        JanelaCRUDA:COLUMN  = PosicaoColuna
        JanelaCRUDA:ROW     = PosicaoLinha.
            
    VIEW FRAME FrameCRUDA IN WINDOW JanelaCRUDA.
    
    //abrir a query dos pedidos do cliente
    
    IF acao = "detalhar" THEN
    DO:
        ENABLE 
            btOK
            btCancelar
            
        WITH FRAME FrameCRUDA.
    END.
    ELSE
    IF acao = "adicionar" THEN
    DO:
        ENABLE
          Customer.Custnum
          Customer.NAME     
          
          Customer.Address
          Customer.Address2
          Customer.PostalCode
          Customer.City 
          Customer.State
          Customer.Country

          Customer.Contact
          Customer.Phone
          Customer.Fax
          Customer.EmailAddress
          
          Customer.SalesRep
          Customer.CreditLimit
          Customer.Balance
          Customer.Terms
          Customer.Discount
          
          Customer.Comments
            btOK
            btCancelar
            
        WITH FRAME FrameCRUDA. 
    END.
    ELSE
    IF acao = "alterar" THEN
    DO:
        ENABLE
          Customer.NAME     
          
          Customer.Address
          Customer.Address2
          Customer.PostalCode
          Customer.City 
          Customer.State
          Customer.Country

          Customer.Contact
          Customer.Phone
          Customer.Fax
          Customer.EmailAddress
          
          Customer.SalesRep
          Customer.CreditLimit
          Customer.Balance
          Customer.Terms
          Customer.Discount
          
          Customer.Comments
          
          btOK
          btCancelar
              
        WITH FRAME FrameCRUDA.
    END.
    
    VIEW JanelaCRUDA.
    
    DISPLAY
          Customer.NAME     
          Customer.CustNum
          
          Customer.Address
          Customer.Address2
          Customer.PostalCode
          Customer.City 
          Customer.State
          Customer.Country

          Customer.Contact
          Customer.Phone
          Customer.Fax
          Customer.EmailAddress
          
          Customer.SalesRep
          Customer.CreditLimit
          Customer.Balance
          Customer.Terms
          Customer.Discount
          
          Customer.Comments

    WITH FRAME FrameCRUDA.    
    
    ENABLE 
        
        btOK
        btCancelar
        
    WITH FRAME FrameCRUDA.    
    
END PROCEDURE.


