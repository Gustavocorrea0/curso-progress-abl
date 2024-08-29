DEF VAR dec-peso AS DEC LABEL "Peso:" NO-UNDO.
DEF VAR dec-altura AS DEC LABEL "Altura:" NO-UNDO.
DEF VAR dec-razao AS DEC LABEL "Razao" NO-UNDO.

UPDATE
      dec-peso
      dec-altura.
      
      
dec-razao = dec-peso / (dec-altura * dec-altura).

DISPLAY 
       dec-razao. 
