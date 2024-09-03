/*
    Exercicio 7: crie um novo programa a partir do quarto exercicio, neste adicione uma variavel
    herde as caracteristicas da variavel existente com a opcao like, mostre-a como Slider, com valor minimo 1,
    valor maximo 100, horizontal e com frequencia de 20
*/

DEF VAR int-slider-1
    AS INT // TIPO
    LABEL "Valores" // TITULO
    INITIAL 1 // VALOR INICIAL
    VIEW-AS SLIDER // ELEMENTO
    MAX-VALUE 100 // VALOR MAXIMO
    MIN-VALUE 1 // VALOR MINIMO
    HORIZONTAL // POSICAO
    TIC-MARKS BOTTOM 
    FREQUENCY 20 // QUANT. MOVIMENTACAO
    SIZE 30 BY 3. // PROPORCOES
    
DEF VAR int-slider-2 LIKE int-slider-1.

UPDATE 
    int-slider-2.
