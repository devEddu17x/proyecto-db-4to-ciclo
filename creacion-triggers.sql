-- cada trigger se debe ejecutar uno por uno para que no genere errores

CREATE OR REPLACE TRIGGER trg_comprobante_calcular_total
BEFORE INSERT ON COMPROBANTE
FOR EACH ROW
DECLARE
    total NUMBER := 0;
    platillo_total NUMBER := 0;
    bebida_total NUMBER := 0;
    extra_total NUMBER := 0;
BEGIN
	-- hallar total de los platillos
    SELECT COALESCE(SUM(p.precio * dp.cantidad), 0)
    INTO platillo_total
    FROM DETALLE_PLATILLO dp 
    JOIN PLATILLO p ON dp.id_platillo = p.id_platillo
    WHERE dp.id_pedido = :NEW.id_pedido;
   -- hallar total de las bebidas
    SELECT COALESCE(SUM(b.precio * bp.cantidad), 0)
    INTO bebida_total
    FROM BEBIDA_PEDIDO bp
    JOIN BEBIDA b ON bp.id_bebida = b.id_bebida
    WHERE bp.id_pedido = :NEW.id_pedido;
   -- hallar total de los extras
    SELECT COALESCE(SUM(e.precio * ep.cantidad), 0)
    INTO extra_total
    FROM EXTRA_PEDIDO ep 
    JOIN EXTRA e ON ep.id_extra = e.id_extra
    WHERE ep.id_pedido = :NEW.id_pedido;
   -- obtener el total sumando lo anterior
    total := platillo_total + bebida_total + extra_total;
    :NEW.total := total;
END;
/

