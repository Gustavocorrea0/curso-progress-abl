/* exemplo de buffer com DISPLAY e EXCEPT */

DEF BUFFER buf-customer FOR customer.

FIND FIRST buf-customer.
IF AVAIL buf-customer THEN
DO:
    DISPLAY buf-customer
        EXCEPT buf-customer.comments WITH 2 COL.
END.
