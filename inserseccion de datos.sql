INSERT ALL 
	-- pollo entero
	INTO PLATILLO(ID_PLATILLO , NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00001', 'Pollo San Pedro', 'Con 1/2 porc. de papa frita', 51.00)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00002', 'Pollo San Pedro', 	'Con 1/2 porc. de papa frita y ensalada', 57.00)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00003', 'Pollo San Pedro', 'Con porc. de papa frita y ensalada', 71.00)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00004', 'Pollo San Pedro', 'Con porc. de papa frita y ensalada + inka cola 1.5 L', 76.00)
	-- medio pollo
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00005', '1/2 Pollo San Pedro', 'Con 1/2 porc. de papa frita y ensalada + 2 pepsi de 500 ml', 38.50)
	-- 1/4 pollo
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00006', '1/4 Pollo San Pedro', 'Con papa frita y ensalda personal + 1 pepsi de 500 ml', 24.50)
	-- pollo solo
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00007', 'Pollo solo San Pedro', 'Pollo entero solo y sin adicionales', 44.00)
	-- platillo criollo
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00008', 'Lomo Saltado', NULL, 28)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00009', 'Saltado de Pollo', NULL, 21.50)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00010', 'Tallarin Saltado de Res', NULL, 28)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00011', 'Saltado Saltado de Pollo', NULL, 21.50)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00012', 'Milanesa', NULL, 16.50)
	
	INTO PLATILLO(ID_PLATILLO, NOMBRE, DESCRIPCION, PRECIO)
	VALUES('P00013', 'Filete de Pollo', NULL, 16.50)

SELECT * FROM dual;

INSERT ALL 

	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDAD_MEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00001', 'Coca Cola', 1.5, 'L', 'Coca cola refrescante de litro y medio', 8.5)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00002', 'Inka Kola', 1.5, 'L', 'Inka Cola refrescante de litro y medio', 8.5)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00003', 'Coca Cola', 500, 'ml', 'Coca cola refrescante de 500 ml', 3.5)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00004', 'Inka Cola', 500, 'ml', 'Inka Cola refrescante de 500 ml', 3.5)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00005', 'Jarra Limonada', 1, 'L', 'Jarra de limonada refrescante de 1 L', 12.00)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00006', 'Agua San Mateo', 600, 'ml', 'Jarra de limonada refrescante de 1 L', 3.00)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00007', 'Te', 1, 'Taza', '1 taza de infusion', 3.00)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00008', 'Te, Canela y Clavo', 1, 'Taza', '1 taza de te con canela y clavo', 3.00)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00009', 'Anis', 1, 'Taza', 'Infusion de Anis', 2.50)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00010', 'Manzanilla', 1, 'Taza', 'Infusion de Manzanilla', 2.50)
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00011', 'Cafe', 1, 'Taza', 'Cafe negro', 3.00)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00012', 'Jarra con Sangria', 1, 'L', 'Vino con fruta', 40.0)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00013', 'Copa de Sangria', 1, 'Copa', 'Copa exquisita', 12.00)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00014', 'Vino Tacama Rosé', 750, 'ml', 'Vino fresco de Tacama', 38.00)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00015', 'Vino Fond de Cave', 750, 'ml', 'Vino fresco de Fond', 38.50)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00016', 'Vino Santiago Queirolo', 1, 'botella', 'Vino Santiado traido de Santiago', 29.50)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00017', 'Vino Tabernero', 1, 'botella', 'Vino de la taberna', 29.50)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00018', 'Cerveza Pilsen Callao', 1, 'botella', 'Cerveza Pilsen de Callao', 8.0)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00019', 'Cerveza Pilsen Trujillo', 1, 'botella', 'Cerveza Pilsen de Trujillo', 8.0)	
	
	INTO BEBIDA(ID_BEBIDA, NOMBRE, CAPACIDAD, UNIDADMEDIDA, DESCRIPCION, PRECIO)
	VALUES('B00020', 'Cerveza Cuzqueña', 1, 'botella', 'Cerveza traida desde Cuzco', 9.0)	
	
SELECT * FROM dual;
	

INSERT ALL
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00001', 'Porc. Papas Fritas', 14)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00002', '1/2 Porc. Papas Fritas', 7.5)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00003', 'Porc. Ensalda Mixta', 13)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00004', '1/2 Porc.Ensalda Mixta', 7)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00005', 'Porc. Arroz', 4)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00006', '1 Hot Dog', 1.5)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00007', '1 Huevo frito', 2)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00008', '1 Huevo sancochado', 2)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00009', '1 Mayonesa', 2)
	
	INTO EXTRA(IDEXTRA, NOMBRE, PRECIO)
	VALUES('E00010', '1 Aji', 2)
	
	
SELECT * FROM DUAL;
	
	
	
INSERT ALL 
    INTO Mozo(IDMOZO, NOMBRE, APELLIDO, DNI, TELEFONO)
    VALUES('M00001', 'Juan', 'Perez', 45678978, 967167272)
    
    INTO Mozo(IDMOZO, NOMBRE, APELLIDO, DNI, TELEFONO)
    VALUES('M00002', 'Rony', 'Lujan', 45678977, 967167273)

    INTO Mozo(IDMOZO, NOMBRE, APELLIDO, DNI, TELEFONO)
    VALUES('M00003', 'Ana', 'Gomez', 45678976, 967167274)

    INTO Mozo(IDMOZO, NOMBRE, APELLIDO, DNI, TELEFONO)
    VALUES('M00004', 'Luis', 'Martinez', 45678975, 967167275)

    INTO Mozo(IDMOZO, NOMBRE, APELLIDO, DNI, TELEFONO)
    VALUES('M00005', 'Maria', 'Lopez', 45678974, 967167276)

SELECT * FROM dual;



INSERT ALL
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00001', 'Carlos', 'Diaz', 'Natural', 'carlosdiaz@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00002', 'Cindy', 'Montoya', 'Juridico', 'cindymontoyai@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00003', 'Luis', 'Fernandez', 'Natural', 'luisfernandez@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00004', 'Ana', 'Gonzalez', 'Juridico', 'anagonzalez@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00005', 'Pedro', 'Martinez', 'Ambos', 'pedromartinez@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00006', 'Laura', 'Ramirez', 'Natural', 'lauraramirez@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00007', 'Jorge', 'Hernandez', 'Juridico', 'jorgehernandez@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00008', 'Sofia', 'Lopez', 'Ambos', 'sofialopez@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00009', 'Andres', 'Torres', 'Natural', 'andrestorres@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00010', 'Mariana', 'Castillo', 'Juridico', 'marianacastillo@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00011', 'Ricardo', 'Pérez', 'Ambos', 'ricardoperez@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00012', 'Valeria', 'Salazar', 'Natural', 'valeriasalazar@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00013', 'Felipe', 'Mendoza', 'Juridico', 'felipemendoza@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00014', 'Tatiana', 'Jimenez', 'Ambos', 'tatianajimenez@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00015', 'Diego', 'Vargas', 'Natural', 'diegovargas@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00016', 'Camila', 'Rojas', 'Juridico', 'camilarojas@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00017', 'Santiago', 'Pineda', 'Ambos', 'santiagopineda@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00018', 'Isabella', 'Nunez', 'Natural', 'isabellanunez@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00019', 'Fernando', 'Alvarez', 'Juridico',  'fernandoalvarez@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00020','Natalia','Cardenas','Ambos','natalia.cardenas@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00021', 'Gabriel', 'Soto', 'Natural', 'gabrielsoto@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00022', 'Paola', 'Cruz', 'Juridico', 'paolacruz@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00023', 'Oscar', 'Castro', 'Ambos', 'osarcastro@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00024', 'Lucia', 'Guerra', 'Natural', 'luciaguerra@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00025', 'Ricardo', 'Mora', 'Juridico', 'ricardomora@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00026', 'Julia', 'Ceballos', 'Ambos', 'juliaceballos@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00027', 'Esteban', 'Hidalgo', 'Natural', 'estebanhidalgo@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00028', 'Marisol', 'Rivas', 'Juridico', 'marisolrivas@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00029', 'Alberto', 'Salas', 'Ambos', 'albertosalas@gmail.com')
    
    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00030', 'Veronica', 'López', 'Natural', 'veronicalopez@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00031', 'Hugo', 'Paz', 'Juridico', 'hugopaz@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00032', 'Claudia', 'Bermudez', 'Ambos', 'claudiabermudez@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00033', 'Fernando', 'García', 'Natural', 'fernandogarcia@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00034', 'Andrea', 'Martínez', 'Juridico','andreamartinez@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00035','Nicolas','Vega','Ambos','nicolasvega@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00036','Sofia','Maldonado','Natural','sofimaldonado@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00037','Emilio','Salas','Juridico','emiliosalas@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00038','Renata','Ocampo','Ambos','renataocampo@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00039','Diego','Quintero','Natural','diegoquintero@gmail.com')

    INTO Cliente(IdCliente, Nombre, Apellido, TipoCliente, CorreoElectronico)
    VALUES('C00040','Luciana','Valdes','Juridico','lucianavaldes@gmail.com')

SELECT * FROM dual;
