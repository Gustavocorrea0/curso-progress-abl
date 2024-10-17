DEFINE VARIABLE c-titulo-frame-principal                    AS CHARACTER  LABEL "FRAMEA" NO-UNDO.
DEFINE VARIABLE c-titulo-identificador-campo-custnum        AS CHARACTER  LABEL "Custnum" NO-UNDO.
DEFINE VARIABLE c-titulo-identificador-campo-name           AS CHARACTER  LABEL "Name" NO-UNDO.
DEFINE VARIABLE c-titulo-identificador-campo-creditlimit    AS CHARACTER  LABEL "Creditlimit"  NO-UNDO.

DEFINE VARIABLE c-titulo-menu-principal AS CHARACTER LABEL "Frame dos Botoes"  NO-UNDO.

/*
DEFINE VARIABLE c-titulo-btn-primeiro   AS CHARACTER LABEL "| <"  NO-UNDO.
DEFINE VARIABLE c-titulo-btn-anterior   AS CHARACTER LABEL "<"  NO-UNDO.
DEFINE VARIABLE c-titulo-btn-proximo    AS CHARACTER LABEL ">"  NO-UNDO.
DEFINE VARIABLE c-titulo-btn-ultimo     AS CHARACTER LABEL "> |"  NO-UNDO.
*/

DEFINE VARIABLE c-informacoes-programa  AS CHARACTER   NO-UNDO.
DEFINE VARIABLE data-hora               AS DATETIME    NO-UNDO INITIAL NOW.

ASSIGN        
      c-informacoes-programa = "PROG_3 - 1.0.0.0 - " + STRING(data-hora).
    

DEFINE FRAME frame-principal
             c-titulo-frame-principal AT ROW 2 COL 35 COLON-ALIGNED
             c-titulo-identificador-campo-custnum  AT ROW 3.3 COL 1 COLON-ALIGNED
             c-titulo-identificador-campo-name AT ROW 4.7 COL 1 COLON-ALIGNED
             c-titulo-identificador-campo-creditlimit AT ROW 6.3 COL 1 COLON-ALIGNED 
             c-informacoes-programa AT ROW 6.3 COL 1
             WITH SIZE 80 BY 20
             CENTERED.
    
DEFINE FRAME frame-custnum
    WITH SIZE 50 BY 1
    AT ROW 3 COL 15.
    
DEFINE FRAME frame-name-customer
    WITH SIZE 50 BY 1
    AT ROW 4.3 COL 15.

DEFINE FRAME frame-credit-limit
    WITH SIZE 50 BY 1
    AT ROW 5.6 COL 15.

DEFINE FRAME frame-menu 
    WITH SIZE 50 BY 4
    AT ROW 8 COL 15.
    
DEFINE FRAME frame-btn-primeiro-item
    WITH SIZE 8 BY 1.3
    AT ROW 10 COL 18.
   
DEFINE FRAME frame-btn-anterior-item
    WITH SIZE 8 BY 1.3
    AT ROW 10 COL 30.

DEFINE FRAME frame-btn-proximo-item
    WITH SIZE 8 BY 1.3
    AT ROW 10 COL 42.
    
DEFINE FRAME frame-btn-ultimo-item
    WITH SIZE 8 BY 1.3
    AT ROW 10 COL 54.

    /*
DEFINE FRAME frame-informacoes-programa
    WITH SIZE 50 BY 2
    AT ROW 12 COL 34.
    */

FRAME frame-custnum:FRAME              = FRAME frame-principal:HANDLE.
FRAME frame-name-customer:FRAME        = FRAME frame-principal:HANDLE.
FRAME frame-credit-limit:FRAME         = FRAME frame-principal:HANDLE.
FRAME frame-menu:FRAME                 = FRAME frame-principal:HANDLE.

FRAME frame-btn-primeiro-item:FRAME    = FRAME frame-principal:HANDLE.
FRAME frame-btn-anterior-item:FRAME    = FRAME frame-principal:HANDLE.
FRAME frame-btn-proximo-item:FRAME     = FRAME frame-principal:HANDLE.
FRAME frame-btn-ultimo-item:FRAME      = FRAME frame-principal:HANDLE.
//FRAME frame-informacoes-programa:FRAME = FRAME frame-principal:HANDLE.

VIEW FRAME frame-principal.             
