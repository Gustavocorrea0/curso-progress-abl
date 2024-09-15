DEFINE TEMP-TABLE tt-item
    LIKE sports2020.ITEM.
    
FOR EACH tt-item NO-LOCK:
    CREATE tt-item.
    BUFFER-COPY ITEM
    TO tt-item.
END.

FOR EACH tt-item:
    DISPLAY
        tt-item.itemnum
        tt-item.itemname.
END.
