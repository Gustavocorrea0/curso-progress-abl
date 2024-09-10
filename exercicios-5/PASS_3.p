/*
    Exercicio 3: Criar programa que execute procedimento interno passe um numero decimal, este procedimento
    devera retornar o numero multiplicado por 2. Utilize um parametro com um numero e outro parametro de retorno para o valor calculado
*/

DEF VAR dec-valor-usuario AS DEC LABEL "Valor" NO-UNDO.

UPDATE
    dec-valor-usuario.
    
RUN pro-multiplicar-por-2(INPUT dec-valor-usuario).

PROCEDURE pro-multiplicar-por-2:
    DEF INPUT PARAMETER dec-valor AS DEC NO-UNDO.
    DEF VAR dec-valor-multiplicado AS DEC NO-UNDO.

    dec-valor-multiplicado = (dec-valor * 2).
    
    MESSAGE dec-valor " * 2 = " dec-valor-multiplicado
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.