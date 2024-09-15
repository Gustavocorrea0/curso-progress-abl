DEFINE TEMP-TABLE tt-aluno
    FIELD codigo AS INT64 LABEL "Codigo"
    FIELD nome AS CHARACTER LABEL "Nome" FORMAT 'x(35)'
    FIELD data-nascimetno AS DATE LABEL "Data nascimento" FORMAT '99/99/9999'
    FIELD mensalidade AS DECIMAL LABEL "Mensalidade"
    
    INDEX idx-codigo AS PRIMARY AS UNIQUE codigo
    INDEX idx-nome AS WORD-INDEX nome.

    CREATE tt-aluno.
    UPDATE tt-aluno WITH COLUMN 1.
