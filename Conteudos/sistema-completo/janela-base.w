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

DEFINE VARIABLE JanelaPrincipal AS HANDLE NO-UNDO.

DEFINE BUTTON btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\first-32.bmp"
    NO-FOCUS
    FLAT-BUTTON
    TOOLTIP "Primeiro Registro" 
    SIZE-PIXELS 40 BY 35.

DEFINE BUTTON btAnterior 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\prev-32.bmp"
    TOOLTIP "Registro Anterior".

DEFINE BUTTON btProximo 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\next-32.bmp"
    TOOLTIP "Proximo Registro".
    
DEFINE BUTTON btUltimo 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\last-32.bmp"
    TOOLTIP "Último Registro".
    
DEFINE BUTTON btPesquisar 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\search-2-32.bmp"
    TOOLTIP "Pesquisar Cliente...".
    
DEFINE BUTTON btAdicionar 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\plus-6-32.bmp"
    TOOLTIP "Adicionar...".
    
DEFINE BUTTON btAlterar 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\edit-12-32.bmp"
    TOOLTIP "Alterar...".
    
DEFINE BUTTON btDetalhar 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\view-details-32.bmp"
    TOOLTIP "Detalhar Cliente...".
    
DEFINE BUTTON btEliminar 
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\x-mark-5-32.bmp"
    TOOLTIP "Eliminar Cliente...".

DEFINE BUTTON btImprimir
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\printer-32.bmp"
    TOOLTIP "Imprimir, exportar e Importar...".
    

DEFINE BUTTON btAjuda
    LIKE btPrimeiro
    IMAGE FILE "E:\Curso Progress 4gl\curso-progress-abl\Conteudos\sistema-completo\image\question-shield-32.bmp"
    TOOLTIP "Ajuda".
    
DEFINE RECTANGLE linha1
    EDGE-PIXELS 2
    GRAPHIC-EDGE
    FGCOLOR 8
    NO-FILL
    SIZE 45 BY .04.
    
DEFINE FRAME FramePrincipal

    btPrimeiro  AT COL 1  ROW 2
    btAnterior  AT COL 9 ROW 2
    btProximo   AT COL 18 ROW 2
    btUltimo    AT COL 27 ROW 2
    btPesquisar AT COL 36 ROW 2
    
    btAdicionar AT COL 58 ROW 2
    btAlterar   AT COL 67 ROW 2
    btDetalhar  AT COL 76 ROW 2
    btEliminar   AT COL 85 ROW 2
    
    btImprimir AT COL 115 ROW 2
    btAjuda AT COL 140 ROW 2
    
    "Cliente"        AT COL 2 ROW 5
    
    Customer.CustNum AT COL 55 ROW 6 COLON-ALIGNED
    Customer.NAME    AT COL 55 ROW 7 COLON-ALIGNED
    Customer.Contact AT COL 55 ROW 8 COLON-ALIGNED
    
    linha1 AT COL 2 ROW 6
    
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
    
    // ATIVA OS BOTOES
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
        linha1
    WITH FRAME FramePrincipal.
    
END PROCEDURE.
