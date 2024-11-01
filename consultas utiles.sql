-- obtener el total de clientes: general, natural, juridico e imparcial (o sea 'ambos')
SELECT
	COUNT(*) AS total_clientes,
	COUNT(CASE WHEN tipo_cliente = 'Natural' THEN 1 END) AS clientes_naturales,
	COUNT(CASE WHEN tipo_cliente = 'Juridico' THEN 1 END) AS clientes_juridicos,
	COUNT(CASE WHEN tipo_cliente = 'Ambos' THEN 1 END) AS clientes_imparciales
FROM CLIENTE;

-- mas proximamente
