/*
    10 - Repita o exercicio 9, mas utilize CASE
*/

DEFINE VARIABLE int-valor-1 AS INT64 LABEL "Valor 1"       NO-UNDO.
UPDATE
        int-valor-1.


CASE int-valor-1:
    WHEN 1 THEN
        MESSAGE "Valor igual 1" VIEW-AS ALERT-BOX INFO.
    WHEN 2 THEN
        MESSAGE "Valor igual 2" VIEW-AS ALERT-BOX INFO.
    WHEN 3 THEN
        MESSAGE "Valor igual 3" VIEW-AS ALERT-BOX INFO.
    OTHERWISE
        MESSAGE "Valor maior que 3" VIEW-AS ALERT-BOX INFO.
END CASE.
