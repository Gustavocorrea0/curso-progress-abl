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

&SCOPED-DEFINE TituloJanela   Pesquisar Clientes
&SCOPED-DEFINE NomePrograma   ZOOM001
&SCOPED-DEFINE VersaoPrograma 2024.1.001

DEFINE VARIABLE JanelaPesquisa AS HANDLE NO-UNDO.

DEFINE VARIABLE codigoIncial 
       LIKE Customer.custnum
       LABEL 'Codigo Incial'.

DEFINE BUTTON btPesquisar
    LABEL "Pesquisar"
    si
       
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

    WITH FRAME FramePrincipal.
    
END PROCEDURE.
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
