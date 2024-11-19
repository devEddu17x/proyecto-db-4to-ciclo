-- obtener el total de clientes: general, natural, juridico e imparcial (o sea 'ambos')
SELECT
	COUNT(*) AS TOTAL_CLIENTES,
	COUNT(
		CASE
			WHEN TIPO_CLIENTE = 'Natural' THEN
				1
		END)    AS CLIENTES_NATURALES,
	COUNT(
		CASE
			WHEN TIPO_CLIENTE = 'Juridico' THEN
				1
		END)    AS CLIENTES_JURIDICOS,
	COUNT(
		CASE
			WHEN TIPO_CLIENTE = 'Ambos' THEN
				1
		END)    AS CLIENTES_IMPARCIALES
FROM
	CLIENTE;

-- obtener el total de ventas por tipo de comprobante
SELECT
	TIPO_COMPROBANTE,
	SUM(TOTAL)       AS TOTAL_VENTAS
FROM
	COMPROBANTE
GROUP BY
	TIPO_COMPROBANTE;

-- mas proximamente