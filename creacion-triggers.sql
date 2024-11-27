-- cada trigger se debe ejecutar uno por uno para que no genere errores

CREATE OR REPLACE TRIGGER TRG_VERIFICAR_MESA_OCUPADA
BEFORE INSERT ON PEDIDO
FOR EACH ROW
DECLARE
	-- variable con el mismo tipo de dato que eestado
    mesa_estado VARCHAR2(10); 
BEGIN
    -- buscando el estado de la mesa
    SELECT ESTADO INTO mesa_estado
    FROM MESA
    WHERE NUMERO_MESA = :NEW.NUMERO_MESA;

    -- si la mesa está ocupada
    IF mesa_estado = 'Ocupado' THEN
        RAISE_APPLICATION_ERROR(-20001, 'La mesa ya está ocupada. Por favor elige otra mesa.');
    END IF;
END;
/



CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_ESTADO_MESA
AFTER INSERT ON PEDIDO
FOR EACH ROW
BEGIN
	UPDATE MESA
    SET ESTADO = 'Ocupado'
    WHERE NUMERO_MESA = :NEW.NUMERO_MESA;
END;
/


CREATE OR REPLACE TRIGGER TGR_CAMBIAR_A_DISPONIBLE_MESA
AFTER INSERT ON COMPROBANTE
FOR EACH ROW
BEGIN
    -- Actualizar el estado de la mesa asociada al pedido
    UPDATE MESA
    SET ESTADO = 'Disponible'
    WHERE NUMERO_MESA = (
        SELECT NUMERO_MESA
        FROM PEDIDO
        WHERE ID_PEDIDO = :NEW.ID_PEDIDO
    );
END;
/


CREATE OR REPLACE TRIGGER trg_comprobante_calcular_total
BEFORE INSERT ON COMPROBANTE
FOR EACH ROW
DECLARE
    total NUMBER := 0;
    platillo_total NUMBER := 0;
    bebida_total NUMBER := 0;
    guarnicion_total NUMBER := 0;
BEGIN
    -- Hallar el total de los platillos
    SELECT COALESCE(SUM(p.precio * pp.cantidad), 0)
    INTO platillo_total
    FROM PLATILLO_PEDIDO pp 
    JOIN PLATILLO p ON pp.id_platillo = p.id_platillo
    WHERE pp.id_pedido = :NEW.id_pedido;
    
    -- Hallar el total de las bebidas
    SELECT COALESCE(SUM(b.precio * bp.cantidad), 0)
    INTO bebida_total
    FROM BEBIDA_PEDIDO bp
    JOIN BEBIDA b ON bp.id_bebida = b.id_bebida
    WHERE bp.id_pedido = :NEW.id_pedido;
    
    -- Hallar el total de las guarniciones
    SELECT COALESCE(SUM(g.precio * gp.cantidad), 0)
    INTO guarnicion_total
    FROM GUARNICION_PEDIDO gp 
    JOIN GUARNICION g ON gp.id_guarnicion = g.id_guarnicion
    WHERE gp.id_pedido = :NEW.id_pedido;
    
    total := platillo_total + bebida_total + guarnicion_total;
    
    :NEW.total := total;
END;
/



