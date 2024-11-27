-- filtro de platillos criollos ordenados por precio

SELECT 
    NOMBRE, 
    PRECIO
FROM 
    PLATILLO
WHERE 
    CATEGORIA = 'Criollo'
ORDER BY 
    PRECIO DESC;


-- obtener categorias y platos de platillos con un precio promedio menor a 30
SELECT 
    CATEGORIA,
    AVG(PRECIO) AS PRECIO_PROMEDIO
FROM 
    PLATILLO
WHERE 
    PRECIO < 30
GROUP BY 
    CATEGORIA;


-- seleccionar categorias donde el precio promedio sea mayor al promedio total
SELECT 
    CATEGORIA, 
    AVG(PRECIO) AS PRECIO_PROMEDIO
FROM 
    PLATILLO
GROUP BY 
    CATEGORIA
HAVING 
    AVG(PRECIO) > (
        SELECT 
            AVG(PRECIO)
        FROM 
            PLATILLO
);

-- seleccionar platillos con precios mayores al precio promedio
SELECT 
    NOMBRE, 
    PRECIO
FROM 
    PLATILLO
WHERE 
    PRECIO > (
        SELECT 
            AVG(PRECIO)
        FROM 
            PLATILLO
);


-- obtener la venta total de platillo el dia de hoy
SELECT 
    PL.NOMBRE AS PLATILLO, 
    SUM(PP.CANTIDAD) AS CANTIDAD_VENDIDA,
    SUM(PP.CANTIDAD * PL.PRECIO) AS VENTA_TOTAL
FROM 
    PLATILLO PL
JOIN 
    PLATILLO_PEDIDO PP ON PL.ID_PLATILLO = PP.ID_PLATILLO
JOIN 
    PEDIDO P ON PP.ID_PEDIDO = P.ID_PEDIDO
WHERE 
	TO_CHAR(P.FECHA, 'YYYY') = TO_CHAR(SYSDATE , 'YYYY') AND TO_CHAR(P.FECHA, 'MM') = TO_CHAR(SYSDATE , 'MM') AND TO_CHAR(P.FECHA, 'DD') = TO_CHAR(SYSDATE , 'DD')
GROUP BY 
    PL.NOMBRE
ORDER BY 
    VENTA_TOTAL DESC;


-- obtener el platillo mas vendido
SELECT 
    PL.NOMBRE AS PLATILLO, Pl.DESCRIPCION AS DESCRIPCION, 
    SUM(PP.CANTIDAD) AS CANTIDAD_VENDIDA_TOTAL
FROM 
    PLATILLO PL
JOIN 
    PLATILLO_PEDIDO PP ON PL.ID_PLATILLO = PP.ID_PLATILLO
GROUP BY 
    PL.NOMBRE, PL.DESCRIPCION 
ORDER BY 
    CANTIDAD_VENDIDA_TOTAL DESC
FETCH FIRST 1 ROWS ONLY;  -- Selecciona solo el platillo más vendido


-- platillo favorito de cada cliente

WITH Totales AS (
    SELECT
        c.ID_CLIENTE,
        pl.ID_PLATILLO,
        SUM(pp.CANTIDAD) AS TOTAL_CANTIDAD
    FROM
        CLIENTE c
    JOIN
        COMPROBANTE comp ON c.ID_CLIENTE = comp.ID_CLIENTE
    JOIN
        PEDIDO p ON comp.ID_PEDIDO = p.ID_PEDIDO
    JOIN
        PLATILLO_PEDIDO pp ON p.ID_PEDIDO = pp.ID_PEDIDO
    JOIN
        PLATILLO pl ON pp.ID_PLATILLO = pl.ID_PLATILLO
    GROUP BY
        c.ID_CLIENTE,
        pl.ID_PLATILLO
),
Maximos AS (
    SELECT
        t.ID_CLIENTE,
        MAX(t.TOTAL_CANTIDAD) AS MAX_CANTIDAD
    FROM
        Totales t
    GROUP BY
        t.ID_CLIENTE
)
SELECT
    c.ID_CLIENTE,
    c.NOMBRE || ' ' || c.APELLIDO_PATERNO || ' ' || c.APELLIDO_MATERNO AS NOMBRE_CLIENTE,
    pl.ID_PLATILLO,
    pl.NOMBRE AS NOMBRE_PLATILLO,
    t.TOTAL_CANTIDAD AS CANTIDAD_PEDIDA
FROM
    Totales t
JOIN
    Maximos m ON t.ID_CLIENTE = m.ID_CLIENTE AND t.TOTAL_CANTIDAD = m.MAX_CANTIDAD
JOIN
    CLIENTE c ON t.ID_CLIENTE = c.ID_CLIENTE
JOIN
    PLATILLO pl ON t.ID_PLATILLO = pl.ID_PLATILLO
ORDER BY
    c.ID_CLIENTE;


-- obtener la hora con mayor demanda
WITH TotalPorHora AS (
    SELECT
        TO_CHAR(p.FECHA, 'HH24') AS HORA,
        SUM(pp.CANTIDAD) AS TOTAL_PLATILLOS
    FROM
        PEDIDO p
    JOIN
        PLATILLO_PEDIDO pp ON p.ID_PEDIDO = pp.ID_PEDIDO
    GROUP BY
        TO_CHAR(p.FECHA, 'HH24')
)
SELECT
    HORA,
    TOTAL_PLATILLOS	
FROM
    TotalPorHora
WHERE
    TOTAL_PLATILLOS = (SELECT MAX(TOTAL_PLATILLOS) FROM TotalPorHora)
ORDER BY
    HORA;

-- obteer el dia de la semana con mayor demanda   
SELECT
    TO_CHAR(p.FECHA, 'Day') AS DIA_SEMANA,
    SUM(pp.CANTIDAD) AS TOTAL_PLATILLOS
FROM
    PEDIDO p
JOIN
    PLATILLO_PEDIDO pp ON p.ID_PEDIDO = pp.ID_PEDIDO
GROUP BY
    TO_CHAR(p.FECHA, 'Day')
HAVING
    SUM(pp.CANTIDAD) = (
        SELECT
            MAX(TOTAL_PLATILLOS)
        FROM
            (
                SELECT
                    SUM(pp2.CANTIDAD) AS TOTAL_PLATILLOS
                FROM
                    PEDIDO p2
                JOIN
                    PLATILLO_PEDIDO pp2 ON p2.ID_PEDIDO = pp2.ID_PEDIDO
                GROUP BY
                    TO_CHAR(p2.FECHA, 'Day')
            )
    );