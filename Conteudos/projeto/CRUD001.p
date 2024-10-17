/*------------------------------------------------------------------------

  File: CRUD001

  Description: programa de manutencao de Clientes e Pedidos

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: Jaison Antoniazzi

  Created: 30/09/2024

------------------------------------------------------------------------*/

CREATE WIDGET-POOL.

&SCOPED-DEFINE LarguraJanela 150
&SCOPED-DEFINE AlturaJanela   25

&SCOPED-DEFINE TituloJanela   Manuten‡Æo de Clientes e Pedidos
&SCOPED-DEFINE NomePrograma   CRUD001
&SCOPED-DEFINE VersaoPrograma 2024.1.001

DEFINE VARIABLE JanelaPrincipal AS HANDLE NO-UNDO.

DEFINE BUTTON btPrimeiro 
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetofirst-32.bmp"
    NO-FOCUS 
    FLAT-BUTTON
    TOOLTIP "Primeiro registro"    
    SIZE-PIXELS 40 BY 40.
    
DEFINE BUTTON btAnterior
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetoprev-32.bmp"
    TOOLTIP "Registro anterior".
    
DEFINE BUTTON btProximo                              
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetonext-32.bmp"
    TOOLTIP "Pr¢ximo registro".   
    
DEFINE BUTTON btUltimo
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetolast-32.bmp"
    TOOLTIP "éltimo registro".     

DEFINE BUTTON btPesquisar
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetosearch-2-32.bmp"
    TOOLTIP "Pesquisar cliente...".
    
DEFINE BUTTON btAdicionar
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetoplus-6-32.bmp"
    TOOLTIP "Adicionar cliente...".    

DEFINE BUTTON btAlterar
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetoedit-12-32.bmp"
    TOOLTIP "Alterar cliente...".
    
DEFINE BUTTON btDetalhar
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetoview-details-32.bmp"
    TOOLTIP "Detalhar cliente...".    

DEFINE BUTTON btEliminar
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetox-mark-5-32.bmp"
    TOOLTIP "Remover cliente...".
    
DEFINE BUTTON btImprimir
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetoprinter-32.bmp"
    TOOLTIP "Imprimir, Exportar e Importar...".    
    
DEFINE BUTTON btAjuda
    LIKE btPrimeiro
    IMAGE FILE "E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projetoquestion-shield-32.bmp"
    TOOLTIP "Ajuda...".
    
DEFINE RECTANGLE linha1
    EDGE-PIXELS 2 
    GRAPHIC-EDGE  
    FGCOLOR 8
    NO-FILL   
    SIZE 32 BY .04.
    
DEFINE RECTANGLE linha2
    LIKE linha1.
    
//query
DEFINE QUERY qrPedidosCliente
    FOR Order 
    FIELDS( Order.OrderNum 
            Order.OrderDate 
            Order.OrderStatus 
            Order.CustNum 
            Order.ShipDate 
            Order.PromiseDate 
            Order.SalesRep)
    SCROLLING.  

//grade
DEFINE BROWSE brPedidosCliente
    QUERY qrPedidosCliente
    NO-LOCK
    
    DISPLAY
        Order.OrderNum      
        Order.OrderDate     FORMAT '99/99/9999' 
        Order.OrderStatus 
        Order.CustNum 
        Order.ShipDate      FORMAT '99/99/9999' 
        Order.PromiseDate   FORMAT '99/99/9999'
        Order.SalesRep

WITH
    12 DOWN  
    WIDTH 146
    //SIZE 146 BY 13.8
    SINGLE
    //[ SEPARATORS | NO-SEPARATORS ]
    SEPARATORS
    NO-ROW-MARKERS
    //FONT 9
    SCROLLBAR-VERTICAL
    FIT-LAST-COLUMN.
    
DEFINE BUTTON btAdicionarPedido
    LABEL 'Adicionar'
    TOOLTIP 'Adicionar pedido...'
    
    NO-FOCUS 
    FLAT-BUTTON
    SIZE 10 BY 1
    //MOUSE-POINTER "image/lupa.cur"
    .
    
DEFINE BUTTON btAlterarPedido
    LIKE btAdicionarPedido
    
    LABEL 'Alterar'
    TOOLTIP 'Alterar pedido...'.
    
DEFINE BUTTON btDetalharPedido
    LIKE btAdicionarPedido
    
    LABEL 'Detalhar'
    TOOLTIP 'Detalhe do pedido...'.
    
DEFINE BUTTON btEliminarPedido
    LIKE btAdicionarPedido
    
    LABEL 'Remover'
    TOOLTIP 'Remover pedido'.    
         
DEFINE FRAME FramePrincipal

    /* botoes */
    btPrimeiro      AT COL  3 ROW 1
    btAnterior      AT COL  9 ROW 1
    btProximo       AT COL 15 ROW 1
    btUltimo        AT COL 21 ROW 1
    
    btPesquisar     AT COL 29 ROW 1
    
    btAdicionar     AT COL 60 ROW 1
    btAlterar       AT COL 66 ROW 1
    btDetalhar      AT COL 72 ROW 1
    
    btEliminar      AT COL 80 ROW 1
    
    btImprimir      AT COL 110 ROW 1
    
    btAjuda         AT COL 143 ROW 1
    
    "Cliente"       AT COL  3 ROW 3
    linha1          AT COL  3 ROW 4.3
    
    Customer.CustNum    AT COL 60 ROW 5 COLON-ALIGNED
    Customer.Name       AT COL 60 ROW 6 COLON-ALIGNED
    Customer.Contact    AT COL 60 ROW 7 COLON-ALIGNED
    
    "Pedidos"       AT COL 3 ROW 8.5
    linha2          AT COL 3 ROW 9.8
    
    brPedidosCliente    AT COL 3 ROW 10.3
    
    btAdicionarPedido   AT COL  3 ROW 24
    btAlterarPedido     AT COL 13 ROW 24
    btDetalharPedido    AT COL 23 ROW 24
    btEliminarPedido    AT COL 33 ROW 24    

WITH 
    1 DOWN 
    NO-BOX 
    SIDE-LABELS
    SIZE {&LarguraJanela} BY {&AlturaJanela}
    //FONT 13.

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

ON CLOSE OF THIS-PROCEDURE 
DO:
    RUN DesabilitarJanela.
END.

ON 'choose':U OF btPrimeiro
DO:
    RUN findFirstCustomer.
END.

ON 'choose':U OF btAnterior
DO:
    RUN findPrevCustomer.
END.

ON 'choose':U OF btProximo
DO:
    RUN findNextCustomer.
END.

ON 'choose':U OF btUltimo
DO:
    RUN findLastCustomer.
END.

ON 'choose':U OF btPesquisar 
DO:
   DEFINE VARIABLE registro AS ROWID       NO-UNDO.
   RUN E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/CRUD001.p (OUTPUT registro). 
   IF RETURN VALUE = 'OK' THEN
   DO:
        FIND FIRST customer
        NO-LOCK      
        WHERE ROWID (customer) = registro
        NO-ERROR.
        
        RUN displayCustomer.
   END.
END.

ON 'choose':U OF btDetalhar
DO:
    IF AVAILABLE customer THEN
    DO:
        RUN E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/CRUD001a.p ( INPUT "detalhar"    
    END.                                                                            BUFFER customer).
END.

ON 'choose':U OF btAlterar
DO:
    IF AVAILABLE customer THEN
    DO:
        DO TRANSACTION:
            FIND CURRENT customer EXCLUSIVE-LOCK.
        
           RUN E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/CRUD001a.p ( INPUT "alterar"    
                                                                                       BUFFER customer).
           IF RETURN-VALUE <> "OK" THEN 
           UNDO, LEAVE.
           
           FIND CURRENT customer NO-LOCK.
           RUN displayCustomer.
        //END.
    END.   
END.

ON 'choose':U OF btAdicionar 
DO:
        DO TRANSACTION:
           CREATE customer.
           ASSIGN
                customer.salesrep = "DOS".
        
           RUN E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/CRUD001a.p ( INPUT "adicionar"    
                                                                                       BUFFER customer).
           IF RETURN-VALUE <> "OK" THEN 
           UNDO, LEAVE.
           
           FIND CURRENT customer NO-LOCK. 
           RUN displayCustomer.
        END.
        
        
END.

ON 'choose':U OF btEliminar
DO:
    DEFINE VARIABLE eliminarCliente AS LOGICAL     NO-UNDO.
    IF  THEN
    DO:
        
    END.
END.

ON 'choose':U OF btDetalharPedido
DO:
    IF AVAILABLE order THEN
    DO:
       FIND CURRENT order NO-LOCK.
       RUN  E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/crud001b.p( INPUT "DETALHAR"
                                      BUFFER order). 
    END.
END.

ON 'choose':U OF btAlterarPedido
DO:
    IF AVAILABLE order THEN
    DO:
       FIND CURRENT order EXCLUSIVE-LOCK.
       
       RUN  E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/crud001b.p( INPUT "alterar"
                                      BUFFER order). 
                                      
       IF RETURN-VALUE <> "OK" THEN UNDO LEAVE.
       
       FIND CURRENT Order NO-LOCK.
    END.
    
    RUN displayOrder.
    
END.

ON 'choose':U OF btAdicionarPedido 
DO:
    IF AVAILABLE Customer THEN
    DO:
        DO TRANSACTION:

               CREATE order.
               ASSIGN
                    order.custnum  = customer.custnum
                    order.salesrep = customer.salesrep.
            
               RUN E:/Curso Progress 4gl/curso-progress-abl/Conteudos/projeto/CRUD001a.p ( INPUT "adicionar"    
                                                                                           BUFFER order).
               IF RETURN-VALUE <> "OK" THEN 
               UNDO, LEAVE.
               
               FIND CURRENT customer NO-LOCK.
               RUN consultarPedidoDoCliente.
               
               //GET LAST qrPedidoCliente
               BROWSE brPedidoCliente
    END.
END.

ON 'choose':U OF btEliminarPedido
DO:
    DEFINE VARIABLE eliminarPedido AS LOGICAL     NO-UNDO.
    
    IF AVAILABLE order THEN
    DO:
        MESSAGE "Confirma a eliminação do pedido"
            VIEW-AS ALERT-BOX
            QUESTION
            BUTTONS YES-NO
            UPDATE eliminarPedido.
        
        IF eliminarPedido THEN
        DO:
           DO TRANSACTION:
            FIND CURRENT order EXCLUSIVE-LOCK.
                DELETE order
           END.
           RUN consultarPedidosCliente.
        END.
    END.
END.

ON 'choose':U OF btImprimir
DO:
    RUN E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\selecao-001.p (OUTPUT selecao).
    
    CASE selecao:
        WHEN "impressao" THEN
        DO:
            DO ON STOP UNDO, LEAVE:
                RUN E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\report001.p
            END.
        END.
        WHEN "exportacao" THEN
        DO:
            DO ON STOP UNDO, LEAVE:
                RUN E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\export001.p
            END.
        END.
        WHEN "importacao" THEN
        DO:
           DO ON STOP UNDO, LEAVE:
                RUN E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\import001.p
           END.
        END.
    END CASE.
    
END.

ASSIGN CURRENT-WINDOW                = JanelaPrincipal 
       THIS-PROCEDURE:CURRENT-WINDOW = JanelaPrincipal.

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
    
                                    "{&TituloJanela}", 
        JanelaPrincipal:TITLE   = SUBSTITUTE("&1 :: &2 : &3",
                                    "{&NomePrograma}",
                                    "{&VersaoPrograma}")
                                
        JanelaPrincipal:COLUMN  = PosicaoColuna
        JanelaPrincipal:ROW     = PosicaoLinha.
            
    VIEW FRAME FramePrincipal IN WINDOW JanelaPrincipal.
    
    //abrir a query dos pedidos do cliente
    
    VIEW JanelaPrincipal.
    
    //btAdicionarPedido:LOAD-MOUSE-POINTER("image/lupa.cur").
    
    ENABLE
        btPrimeiro
        btAnterior
        btProximo
        btUltimo
        btPesquisar
        
        btAdicionar
        btAlterar
        btDetalhar
        btEliminar
        
        btImprimir
        
        btAjuda
        
        brPedidosCliente
        
        btAdicionarPedido        
        btAlterarPedido
        btDetalharPedido
        btEliminarPedido
        
    WITH FRAME FramePrincipal.
    
    RUN findFirstCustomer.
    
END PROCEDURE.

PROCEDURE findFirstCustomer:
    /* navegar para o primeiro cliente */
    FIND FIRST customer
    NO-LOCK
    NO-ERROR.
    
    RUN displayCustomer. 
END.

PROCEDURE findPrevCustomer:
    /* navegar para o cliente anterior */
    FIND PREV customer
    NO-LOCK
    NO-ERROR.
    
    RUN displayCustomer. 
END.

PROCEDURE findNextCustomer:
    /* navegar para o proximo cliente */
    FIND NEXT customer
    NO-LOCK
    NO-ERROR.
    
    RUN displayCustomer. 
END.

PROCEDURE findLastCustomer:
    /* navegar para o ultimo cliente */
    FIND LAST customer
    NO-LOCK
    NO-ERROR.
    
    RUN displayCustomer.
END.

PROCEDURE displayCustomer:
    /* exibir o cliente */
    IF AVAILABLE customer THEN
    DO:
        DISPLAY
            Customer.CustNum
            Customer.Name   
            Customer.Contact
        WITH FRAME FramePrincipal.
        
        RUN consultarPedidosCliente.
    END.    
END.

PROCEDURE consultarPedidosCliente:
    /* abrir a consulta dos pedidos do cliente corrente */
    OPEN QUERY qrPedidosCliente
    FOR EACH order
    NO-LOCK
    WHERE order.custnum = customer.custnum.
END.


PROCEDURE displayOrder:
    BROWSE brPedidosCliente:REFRESH(). // METODO PARA ATUALIZAR A LINHA DA GRADE
END.
