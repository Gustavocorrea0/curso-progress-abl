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

&SCOPED-DEFINE Listagem   
&SCOPED-DEFINE NomePrograma   
&SCOPED-DEFINE VersaoPrograma 2024.1.001


//DEFINE VARIABLE registro AS ROWID       NO-UNDO.

/*{E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\linha-001.i 
    &NomeLinha=linha1}
*/
                
DEFINE VAR JanelaDialogo AS HANDLE NO-UNDO.
DEFINE VARIABLE raw-param AS RAW.

{E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\imagem-inicial-001.i &NomeImage-imFirstCodigo}
{E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\imagem-inicial-001.i &NomeImage-imFirstNome}

{E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\imagem-inicial-001.i &NomeImage-imLastCodigo}
{E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\imagem-inicial-001.i &NomeImage-imLastNome}

{E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\report001tt.i}

DEFINE VARIABLE codigoInicial LIKE customer.custnum
    LABEL "Cliente Inicial"
    INITIAL 0.

DEFINE VARIABLE codigoFinal LIKE customer.NAME
    LABEL "Nome Final"
    INITIAL "".                                                                                  
    
DEFINE VARIABLE nomeFinal LIKE customer.NAME
    INITIAL "ZZZZZZZZZ".
    
DEFINE VARIABLE selecao AS CHARACTER 
    FORMAT 'x(40)' 
    VIEW-AS RADIO-SET
    VERTICAL
    SIZE 50 BY 4
    RADIO-BUTTONS
    "Terminal", "terminal",
    "Impressora", "impressora",
    "Arquivo", "arquivo"
    TOOLTIP "Selecao do programa"
    
    INITIAL "terminal".
    
DEFINE BUTTON btSelecaoArquivo
    LABEL "..."
    TOOLTIP "Selecionar o Arquivo..."
    SIZE 3 BY 1
    NO-FOCUS
    FLAT-BUTTON.
    
DEFINE VARIABLE destino AS CHARACTER 
    FORMAT 'x(40)' 
    VIEW-AS RADIO-SET
    VERTICAL
    SIZE 50 BY 4
    RADIO-BUTTONS
    "Terminal", "terminal",
    "Impressora", "impressora",
    "Arquivo", "arquivo"
    TOOLTIP "Selecao do programa"
    
    INITIAL "terminal".
    
DEFINE VARIABLE arquivo AS CHARACTER   NO-UNDO 
    FORMAT 'x(500)'
    INITIAL ""
    VIEW-AS FILL-IN
    SIZE 50 BY 1.
    
DEFINE BUTTON btOK
    LABEL 'Executar'
    SIZE 10 BY 1
    NO-FOCUS
    FLAT-BUTTON.
    
DEFINE BUTTON btCancelar
    LIKE btOK
    LABEL 'Cancelar'
    AUTO-ENDKEY.

DEFINE FRAME FrameDialogo
     ASSIGN
            arquivo = SUBSTITUTE ("&1&2",
                                  SESSION:TEMP-DIRECTORY,
                                  "{&NomePrograma}").
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
    
    "Selecao"       AT ROW 3 COL 3
    
    codigoInicial   AT ROW 1.5 COL 30
    codigoFinal     AT ROW 1.5 COL 80 NO-LABEL
    
    imFirstCodigo   AT ROW 5.5 COL 68
    imLastCodigo    AT ROW 5.5 COL 85
    
    nomeInicial     AT ROW 5.5 COL 30
    codigoFinal     AT ROW 5.5 COL 80 NO-LABEL
    
    
    imFirstNome   AT ROW 7 COL 68
    imLastNome    AT ROW 7 COL 85
    
    "impressao"      AT ROW 12 COL 3
    linha1          AT ROW 4.8 COL 3 

    destino         AT ROW 14.5 COL 3 NO-LABEL
    
    arquivo         AT ROW 17.5 COL 80 NO-LABEL
    
    btSelecaoArquivo AT ROW 17.5 COL 131
    
    btOK            AT ROW 19.5 COL 3
    btCancelar      AT ROW 19.5 COL 13
    
WITH 
    1 DOWN 
    NO-BOX 
    SIDE-LABELS
    SIZE {&LarguraJanela} BY {&AlturaJanela}
    //FONT 12.
    .

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
        
ASSIGN
    codigoInicial
    codigoFinal
    
    nomeInicial
    nomeFinal
    
    destino
    
    arquivo.
    
    // ELIMINA TODOS OS REGISTROS DA TEMP TABLE
    EMPTY TEMP-TABLE tt-param.
    
    CREATE tt-param.
    ASSIGN
            tt-param.clienteInicial = codigoInicial
            tt-param.clienteFinal = codigoFinal
            tt-param.nomeClienteInicial = nomeInicial
            tt-param.nomeClienteFinal = nomeFinal
            tt-param.destinoImpressao = destino
            tt-param.arquivoImpressao = arquivo.

    RAW-TRANSFER BUFFER tt-param
    TO raw-param.
    
    RUN E:\Curso Progress 4gl\curso-progress-abl\Conteudos\projeto\report001rpa.p ( INPUT raw-param).
    
END.

ON 'value-changed':U OF destino 
DO:
    ASSIGN
        destino.
        
    DISABLE
        btSelecaoArquivo
        WITH FRAME FrameDailogo.
        
        IF destino = "Arquivo" THEN
        DO:
           ENABLE
                btSelecaoArquivo 
           WITH FRAME FrameDialogo.
        END.
        
END.

ON 'choose':U OF btSelecaoArquivo 
DO:
    DEFINE VARIABLE arquivo-selecionado AS CHARACTER   NO-UNDO.
    DEFINE VARIABLE salvar AS LOGICAL     NO-UNDO.

    ASSIGN
        arquivo-selecionado = arquivo.
    
    SYSTEM-DIALOG GET-FILE arquivo-selecionado
        FILTERS 
        "Arquivo texto (*.txt)" "*.txt",
        "Arquivo listagem (*.lst)" "*.lst",
        "Todos os arquivos (*.*)" "*.*"
        
        ASK-OVERWRITE 
        
        DEFAULT-EXTENSION ".txt"
        SAVE-AS
        
        TITLE "Informe, por favor, o nome do arquivo"
        
        USE-FILENAME                             
        UPDATE salvar.
        
    IF salvar THEN
    DO:
       ASSIGN
            arquivo = arquivo-selecionado.
       
       DISPLAY
            arquivo 
       WITH FrameDialogo.
    END.
    
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
            codigoInicial
            codigoFinal  
            
            imFirstCodigo
            imLastCodigo 
            
            nomeInicial  
            codigoFinal  
            
            
            imFirstNome  
            imLastNome   
            
            "impressao"  
            linha1       

            destino      
            
            arquivo      
    
            btOK         
            btCancelar   
        
    WITH FRAME FrameDialogo.    
    
    ENABLE 
        codigoInicial
        codigoFinal  
          
        nomeInicial  
        codigoFinal      

        destino      
        
        btOK
        btCancelar
        
    WITH FRAME FrameDialogo.    
    
END PROCEDURE.
