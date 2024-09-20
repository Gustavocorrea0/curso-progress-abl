/*
    Exercicio 4: Crie um programa que execute um procedimento interno, passa um numero decimal, este procedimento
    retornar o numero multiplicado por 2. Utilize passagem por refenrencia
*/

DEF VAR dec-valor-usuario AS DEC LABEL "Valor" NO-UNDO.

UPDATE
    dec-valor-usuario.
    
RUN pro-multiplicar-por-2(INPUT-OUTPUT dec-valor-usuario).

MESSAGE "Resultado: " dec-valor-usuario
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

PROCEDURE pro-multiplicar-por-2:
    DEF INPUT-OUTPUT PARAMETER dec-valor AS DEC NO-UNDO.

    dec-valor = (dec-valor * 2).
END.