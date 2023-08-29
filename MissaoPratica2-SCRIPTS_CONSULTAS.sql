--DADOS COMPLETOS DE PESSOAS FISICAS:
SELECT * FROM fisica;

--DADOS COMPLETOS DE PESSOAS JURÍDICAS:
SELECT * FROM juridica;

--MOVIMENTAÇÕES DE ENTRADA, COM PRODUTO, QTD, PREÇO UN E VALOR TOTAL:
SELECT
    produto.nome,
    juridica.nome,
    movimentacoes.quantidade,
    movimentacoes.valorunitario,
    movimentacoes.quantidade * movimentacoes.valorunitario AS valortotal
FROM
    produto,
    juridica,
    movimentacoes
WHERE
    movimentacoes.tipo = 'E';

--MOVIMENTAÇÕES DE SAIDA, COM PRODUTO, QTD, PREÇO UN E VALOR TOTAL:
SELECT
    produto.nome,
    juridica.nome,
    movimentacoes.quantidade,
    movimentacoes.valorunitario,
    movimentacoes.quantidade * movimentacoes.valorunitario AS valortotal
FROM
    produto,
    juridica,
    movimentacoes
WHERE
    movimentacoes.tipo = 'S';

--VALOR TOTAL DAS ENTRADAS AGRUPADAS POR PRODUTOS:
SELECT
    movimentacoes.idproduto,
    SUM(movimentacoes.quantidade) AS total_quantidade,
    SUM(movimentacoes.valorunitario * movimentacoes.quantidade) AS total_valortotal
FROM
    movimentacoes
WHERE
    movimentacoes.tipo = 'E'
GROUP BY
    movimentacoes.idproduto;


--VALOR TOTAL DAS SAÍDAS AGRUPADAS POR PRODUTOS:
SELECT
    movimentacoes.idproduto,
    SUM(movimentacoes.quantidade) AS total_quantidade,
    SUM(movimentacoes.valorunitario * movimentacoes.quantidade) AS total_valortotal
FROM
    movimentacoes
WHERE
    movimentacoes.tipo = 'S'
GROUP BY
    movimentacoes.idproduto;

-- OPERADORES QUE NÃO EFETUARAM MOVIMENTAÇÕES DE COMPRA:
SELECT
    fisica.idpessoafisica,
    fisica.nome
FROM
    fisica
LEFT JOIN
    movimentacoes ON fisica.idpessoafisica = movimentacoes.idpessoa
WHERE
    movimentacoes.idpessoa IS NULL;

--VALOR TOTAL DE ENTRADA, AGRUPADO POR OPERADOR:
SELECT
    movimentacoes.idusuario,
    SUM(movimentacoes.quantidade) AS total_quantidade,
    SUM(movimentacoes.valorunitario * movimentacoes.quantidade) AS total_valortotal
FROM
    movimentacoes
WHERE
    movimentacoes.tipo = 'E'
GROUP BY
    movimentacoes.idusuario;
--VALOR TOTAL DE SAÍDA, AGRUPADO POR OPERADOR:
SELECT
    movimentacoes.idusuario,
    SUM(movimentacoes.quantidade) AS total_quantidade,
    SUM(movimentacoes.valorunitario * movimentacoes.quantidade) AS total_valortotal
FROM
    movimentacoes
WHERE
    movimentacoes.tipo = 'S'
GROUP BY
    movimentacoes.idusuario;
--VALOR MÉDIO DE VENDA POR PRODUTO:
SELECT
    movimentacoes.idproduto,
    SUM(movimentacoes.quantidade) AS total_quantidade,
    SUM(movimentacoes.valorunitario * movimentacoes.quantidade) AS total_valortotal,
    ROUND(SUM(movimentacoes.valorunitario * movimentacoes.quantidade) / SUM(movimentacoes.quantidade), 2) AS media_valores
FROM
    movimentacoes
WHERE
    movimentacoes.tipo = 'S'
GROUP BY
    movimentacoes.idproduto;
 