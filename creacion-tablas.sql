--CREATE USER polleria_db IDENTIFIED BY polleria_db;
--GRANT CONNECT, RESOURCE to polleria_db;
--ALTER USER polleria_db QUOTA UNLIMITED ON USERS;

-- Creación del usuario (opcional)
-- CREATE USER polleria_db IDENTIFIED BY polleria_db;
-- GRANT CONNECT, RESOURCE TO polleria_db;
-- ALTER USER polleria_db QUOTA UNLIMITED ON USERS;

CREATE TABLE MESA (
    NUMERO_MESA INTEGER,
    ESTADO VARCHAR2(10) NOT NULL CONSTRAINT MES_ESTADO_CK CHECK (ESTADO IN ('Disponible', 'Ocupado')),
    CONSTRAINT MES_NUMERO_PK PRIMARY KEY (NUMERO_MESA)
);


CREATE TABLE PLATILLO (
    ID_PLATILLO VARCHAR2(10),
    NOMBRE VARCHAR2(50) NOT NULL,
    PRECIO NUMERIC(5, 2) CONSTRAINT PLA_PRECIO_CK CHECK (PRECIO > 0),
    DESCRIPCION VARCHAR2(255),
    CONSTRAINT PLA_ID_PLATILLO_PK PRIMARY KEY (ID_PLATILLO)
);

CREATE TABLE GUARNICION (
    ID_GUARNICION VARCHAR2(10),
    PORCION VARCHAR2(3) NOT NULL,
    NOMBRE VARCHAR2(50) NOT NULL,
    PRECIO NUMERIC(5, 2) CONSTRAINT GUA_PRECIO_CK CHECK (PRECIO > 0),
    CANTIDAD INTEGER CONSTRAINT GUA_CANTIDAD_CK CHECK (CANTIDAD > 0),
    MAGNITUD VARCHAR2(5),
    CONSTRAINT GUA_ID_GUARNICION_PK PRIMARY KEY (ID_GUARNICION)
);

CREATE TABLE BEBIDA (
    ID_BEBIDA VARCHAR2(10),
    NOMBRE VARCHAR2(50) NOT NULL,
    PRECIO NUMERIC(5, 2) CONSTRAINT BEB_PRECIO_CK CHECK (PRECIO > 0),
    DESCRIPCION VARCHAR2(255),
    CONSTRAINT BEB_ID_BEBIDA_PK PRIMARY KEY (ID_BEBIDA)
);

CREATE TABLE CLIENTE (
    ID_CLIENTE VARCHAR2(10),
    NOMBRE VARCHAR2(50) NOT NULL,
    APELLIDO VARCHAR2(50) NOT NULL,
    TELEFONO VARCHAR2(15) NOT NULL,
    CORREO_ELECTRONICO VARCHAR2(255),
    CONSTRAINT CLI_ID_CLIENTE_PK PRIMARY KEY (ID_CLIENTE)
);

CREATE TABLE MOZO (
    ID_MOZO VARCHAR2(10),
    NOMBRE VARCHAR2(50) NOT NULL,
    APELLIDO_PATERNO VARCHAR2(50) NOT NULL,
    APELLIDO_MATERNO VARCHAR2(50) NOT NULL,
    DNI VARCHAR2(8) NOT NULL,
    CONSTRAINT MOZ_ID_MOZO_PK PRIMARY KEY (ID_MOZO)
);

CREATE TABLE PEDIDO (
    ID_PEDIDO VARCHAR2(10),
    FECHA DATE DEFAULT SYSDATE NOT NULL,
    ESTADO VARCHAR2(20) NOT NULL CONSTRAINT PED_ESTADO_CK CHECK (ESTADO IN ('Pendiente', 'Cancelado')),
    ID_MOZO VARCHAR2(10),
    NUMERO_MESA INTEGER,
    CONSTRAINT PED_ID_PEDIDO_PK PRIMARY KEY (ID_PEDIDO),
    CONSTRAINT PED_MOZO_FK FOREIGN KEY (ID_MOZO) REFERENCES MOZO(ID_MOZO),
    CONSTRAINT PED_MESA_FK FOREIGN KEY (NUMERO_MESA) REFERENCES MESA(NUMERO_MESA)
);

CREATE TABLE PLATILLO_PEDIDO (
    ID_PEDIDO VARCHAR2(10),
    ID_PLATILLO VARCHAR2(10),
    CANTIDAD INTEGER CONSTRAINT PLAPED_CANTIDAD_CK CHECK (CANTIDAD > 0),
    
    CONSTRAINT PLAPED_PK PRIMARY KEY (ID_PEDIDO, ID_PLATILLO),
    CONSTRAINT PLAPED_PEDIDO_FK FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    CONSTRAINT PLAPED_PLATILLO_FK FOREIGN KEY (ID_PLATILLO) REFERENCES PLATILLO(ID_PLATILLO)
);


CREATE TABLE BEBIDA_PEDIDO (
    ID_PEDIDO VARCHAR2(10),
    ID_BEBIDA VARCHAR2(10),
    CANTIDAD INTEGER CONSTRAINT BEBPED_CANTIDAD_CK CHECK (CANTIDAD > 0),
    PRECIO_UNITARIO NUMERIC(5, 2) CONSTRAINT BEBPED_PRECIO_CK CHECK (PRECIO_UNITARIO > 0),
    CONSTRAINT BEBPED_PK PRIMARY KEY (ID_PEDIDO, ID_BEBIDA),
    CONSTRAINT BEBPED_PEDIDO_FK FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    CONSTRAINT BEBPED_BEBIDA_FK FOREIGN KEY (ID_BEBIDA) REFERENCES BEBIDA(ID_BEBIDA)
);

CREATE TABLE GUARNICION_PEDIDO (
    ID_PEDIDO VARCHAR2(10),
    ID_GUARNICION VARCHAR2(10),
    CANTIDAD INTEGER CONSTRAINT GUAPED_CANTIDAD_CK CHECK (CANTIDAD > 0),
    PRECIO_UNITARIO NUMERIC(5, 2) CONSTRAINT GUAPED_PRECIO_CK CHECK (PRECIO_UNITARIO > 0),
    CONSTRAINT GUAPED_PK PRIMARY KEY (ID_PEDIDO, ID_GUARNICION),
    CONSTRAINT GUAPED_PEDIDO_FK FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    CONSTRAINT GUAPED_GUARNICION_FK FOREIGN KEY (ID_GUARNICION) REFERENCES GUARNICION(ID_GUARNICION)
);

CREATE TABLE COMPROBANTE (
    ID_COMPROBANTE VARCHAR2(6),
    FECHA DATE DEFAULT SYSDATE NOT NULL,
    TOTAL NUMERIC(6,2) NOT NULL,
    TIPO_COMPROBANTE VARCHAR2(16) NOT NULL CONSTRAINT COM_TIPO_CK CHECK (TIPO_COMPROBANTE IN ('Boleta', 'Factura')),
    ID_PEDIDO VARCHAR2(6),
    ID_CLIENTE VARCHAR2(6),
    CONSTRAINT COM_ID_COMPROBANTE_PK PRIMARY KEY (ID_COMPROBANTE),
    CONSTRAINT COM_PEDIDO_FK FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    CONSTRAINT COM_CLIENTE_FK FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

CREATE TABLE FACTURA (
    NUMERO INTEGER,
    ID_COMPROBANTE VARCHAR2(10),
    RUC VARCHAR2(11) NOT NULL,
    DNI VARCHAR2(8),
    CONSTRAINT FAC_NUMERO_PK PRIMARY KEY (NUMERO),
    CONSTRAINT FAC_COMPROBANTE_FK FOREIGN KEY (ID_COMPROBANTE) REFERENCES COMPROBANTE(ID_COMPROBANTE)
);

CREATE TABLE BOLETA (
    NUMERO INTEGER,
    ID_COMPROBANTE VARCHAR2(10),
    DNI VARCHAR2(8) NOT NULL,
    CONSTRAINT BOL_NUMERO_PK PRIMARY KEY (NUMERO),
    CONSTRAINT BOL_COMPROBANTE_FK FOREIGN KEY (ID_COMPROBANTE) REFERENCES COMPROBANTE(ID_COMPROBANTE)
);


