DEF TEMP-TABLE tt-salesrep NO-UNDO LIKE Salesrep.

FOR EACH Salesrep NO-LOCK:
    CREATE tt-salesrep.
    BUFFER-COPY Salesrep TO tt-salesrep.
END.

FOR EACH tt-salesrep NO-LOCK:
    DISPLAY
        tt-salesrep.Region 
        tt-salesrep.RepName.
END.
