USE ExDLL_DML

SELECT id, ano, 
	CASE 
		WHEN LEN(titulo) >= 10 THEN
			SUBSTRING(titulo, 1, 10) + '....'
		ELSE
			titulo
	END as titulo
FROM Filme
WHERE id IN 
(
	SELECT filmeId
	FROM DVD	
	WHERE DATEDIFF(DAY, '01/01/2020', data_fabricacao) >= 0  
)

SELECT num, data_fabricacao,
	DATEDIFF(MONTH, data_fabricacao, GETDATE()) as qtd_meses_desde_fabricacao
FROM DVD
WHERE filmeId IN
(
	SELECT id 
	FROM Filme 
	WHERE titulo like 'Interestelar'
)

SELECT dvdNum, data_locacao, data_devolucao,	
		DATEDIFF(DAY, data_locacao, data_devolucao) as dias_alugado,
		valor
FROM Locacao 
WHERE clienteNum_Cadastro IN
(
	SELECT num_cadastro 
	FROM Cliente 
	WHERE nome like '%Rosa%'
)

SELECT nome, 
	logradouro + ',' + CAST(num as VARCHAR(5)) AS endereco_completo,
	SUBSTRING(cep, 1, 5)+'-'+ SUBSTRING(cep, 6, 3) AS cep
FROM Cliente 
WHERE num_cadastro IN 
(
	SELECT clienteNum_Cadastro
	FROM Locacao
	WHERE dvdNum = 10002
)

SELECT * FROM Filme
SELECT * FROM DVD

