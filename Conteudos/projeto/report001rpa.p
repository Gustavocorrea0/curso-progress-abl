/* PROGRAMA report001rpa */
{Conteudos\projeto\report001tt.i}

/* RECEBE O PARAMETRO RAW PARA A tt-param*/
DEFINE INPUT PARAMETER raw-param AS RAW.

CREATE tt-param.

RAW-TRANSFER FIELD raw-param TO tt-param.

CASE tt-param.destinoImpressao:
    WHEN "terminal" THEN
    DO:
        DO ON ERROR UNDO, LEAVE:
            RUN Conteudos\projeto\report001rpb.p (INPUT raw-param).
        END.
    END.
    WHEN "impressora" THEN
    DO:
        DO ON ERROR UNDO, LEAVE:
            RUN Conteudos\projeto\report001rpc.p (INPUT raw-param).
        END.       
    END.
    WHEN "arquivo" THEN
    DO:
        DO ON ERROR UNDO, LEAVE:
            RUN Conteudos\projeto\report001rpd.p (INPUT raw-param).
        END.     
    END.
END CASE.
